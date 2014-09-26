# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140926214427) do

  create_table "alumnis", :force => true do |t|
    t.integer  "university_id"
    t.string   "name"
    t.string   "email"
    t.integer  "phone"
    t.integer  "age"
    t.integer  "graduation_year"
    t.string   "linkedin"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "majors", :force => true do |t|
    t.integer  "uni_major_id"
    t.string   "name"
    t.string   "description"
    t.string   "level"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "uni_majors", :force => true do |t|
    t.integer  "university_id"
    t.integer  "major_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "universities", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "phone"
    t.string   "email"
    t.integer  "alumni_id"
    t.integer  "uni_major_id"
    t.string   "city"
    t.string   "state"
    t.integer  "balance"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end