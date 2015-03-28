class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @attachment = Attachment.new 
    @note = Note.new
  end

  def new
    @project = Project.new

  end

  def edit
    @project = Project.find(params[:id])
    #@item = InventoryItem.find(@project.project_items)   
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      @note = Note.new
      @note.body = "New note created.(new)"
#      @note.body = "New " + @project.type + " Project created on " + @project.created_at + "."
      @note.project_id = @project.id
      @note.user_id = current_user.id
      @note.save
      flash[:notice] = "New project created"
      redirect_to @project
    else
      flash[:error] = "Please fix the errors"
      render :new
    end
  end

#updating stages: 
# project stages are : predesign, awating delivery, awaiting design, contracting, awaiting installation
# punch list, in rental, complete, cancelled. 
# a rental project can advance to in rental once all rental items are checked out 
# a rental/purchase/rental project cannnot advance to punchlist/prelim punch list until at least one item checked out 
# a prject cannot be complete or canceled until all rental items checked in 
# for every stage change, the project's timeline will receive an entry detailling the beginning stage, ending stage, and user who advanced/rolledback the stage

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      @note = Note.new
      @note.body = "new Note created (update)"
#      @note.body = "Project " + @project.name + " advanced to stage: " + @project.stage + " on " + @note.created_at + "."
      @note.project_id = @project.id
      @note.user_id = current_user.id
      @note.save
      flash[:notice] = "Project updated"
      redirect_to @project
    else
      flash[:error] = "Please fix the errors."
      render :edit
    end
  end

  def upload 
    uploaded_io = params[:project][:picture]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
    file.write(uploaded_io.read)
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:success] = "Project Deleted"
    redirect_to projects_path 
  end

  def set_basket
    session[:project_id] = params[:project_id]
    flash[:notice] = "Basket changed"
    redirect_to :back
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :type, :stage, :customer_id, :sale_delivery, :rental_delivery, :rental_pickup)
    end
end
