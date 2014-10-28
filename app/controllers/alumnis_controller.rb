class AlumnisController < ApplicationController
  # GET /alumnis
  # GET /alumnis.json
      load_and_authorize_resource
  def index
    @alumnis = Alumni.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @alumnis }
    end
  end


def invite
   @alumni = Alumni.find(params[:id])
   Alumni.invite!(:email => @alumni.email)
   flash.now[:success] = "Invitation email has been sent"
   respond_to do |format|
     format.js
   end
 end


  # GET /alumnis/1
  # GET /alumnis/1.json
  def show
    @alumni = Alumni.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @alumni }
    end
  end

  # GET /alumnis/new
  # GET /alumnis/new.json
  def new
    @alumni = Alumni.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @alumni }
    end
  end

  # GET /alumnis/1/edit
  def edit
    @alumni = Alumni.find(params[:id])
  end

  # POST /alumnis
  # POST /alumnis.json
  def create
    @alumni = Alumni.new(params[:alumni])

    respond_to do |format|
      if @alumni.save
        format.html { redirect_to @alumni, notice: 'Alumni was successfully created.' }
        format.json { render json: @alumni, status: :created, location: @alumni }
      else
        format.html { render action: "new" }
        format.json { render json: @alumni.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /alumnis/1
  # PUT /alumnis/1.json
  def update
    @alumni = Alumni.find(params[:id])

    respond_to do |format|
      if @alumni.update_attributes(params[:alumni])
        format.html { redirect_to @alumni, notice: 'Alumni was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @alumni.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alumnis/1
  # DELETE /alumnis/1.json
  def destroy
    @alumni = Alumni.find(params[:id])
    @alumni.destroy

    respond_to do |format|
      format.html { redirect_to alumnis_url }
      format.json { head :no_content }
    end
  end

  
end
