class University < ActiveRecord::Base

  has_many :uni_majors
  has_many :majors, through: :uni_majors
  has_many :alumni

  attr_accessible :address, :alumni_id, :balance, :city, :email, :name, :phone, :state, :uni_major_id, :picture, :majors, :filterrific, :major_ids
  has_attached_file :picture, :default_url => "image1.jpg"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

filterrific(
  default_settings: { sorted_by: 'created_at_desc' },
  filter_names: [
    :search_query,
    :sorted_by
  ]
)
scope :search_query, lambda { |query|
return nil if query.blank?
# condition query, parse into individual keywords
terms = query.downcase.split(/\s+/)
# replace "*" with "%" for wildcard searches,
# append '%', remove duplicate '%'s
terms = terms.map { |e|
(e.gsub('*', '%') + '%').gsub(/%+/, '%')
}
# configure number of OR conditions for provision
# of interpolation arguments. Adjust this if you
# change the number of OR conditions.
num_or_conditions = 3
where(
terms.map {
or_clauses = [
"LOWER(universities.name) LIKE ?",
"LOWER(universities.city) LIKE ?",
"LOWER(universities.email) LIKE ?"
].join(' OR ')
"(#{ or_clauses })"
}.join(' AND '),
*terms.map { |e| [e] * num_or_conditions }.flatten
)
}
scope :sorted_by, lambda { |sort_option|
# extract the sort direction from the param value.
direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
case sort_option.to_s
when /^created_at_/
order("universities.created_at #{ direction }")
when /^name_/
order("LOWER(universities.name) #{ direction }, LOWER(universities.name) #{ direction }")
else
raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
end
}
scope :with_created_at_gte, lambda { |ref_date|
where('universities.created_at >= ?', ref_date)
}

def self.options_for_sorted_by
[
['Name (a-z)', 'name_asc'],
['Registration date (newest first)', 'created_at_desc'],
['Registration date (oldest first)', 'created_at_asc']

]
end

end
