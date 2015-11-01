class ProjectsController < ApplicationController
   before_filter :authenticate_user!  
  def index
   @projects = current_user.admin? ? Project.all : current_user.projects
    @project = current_user.projects
  end
  def new
    @project = Project.new
  end
  def create
    @project = Project.new(project_params)

    @project.user_id = current_user.admin? ? Client.find(@project.client_id).user_id : current_user.id
    if @project.save 
      redirect_to project_path(@project.id)
    else 
      render action: 'new'
    end
  end
  
  def show
		begin
    @project = current_user.admin? ? Project.find(params[:id]) : current_user.projects.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_url, notice: "Record Does Not Exist"
  end
  end
    
  def edit 
		begin
    @project.user_id = current_user.admin? ? Client.find(@project.client_id).user_id : current_user.id
  rescue ActiveRecord::RecordNotFound
    redirect_to root_url, notice: "Record Does Not Exist"
  end
  end
  
  def update 
  
    @project.user_id = current_user.admin? ? Client.find(@project.client_id).user_id : current_user.id
    if @project.update_attributes(project_params)
      redirect_to projects_path(@project)
    else
      render action: "edit"
    end
  
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end
    
    
   
  
  
  
  private 
  
  def project_params
    params[:project].permit(:name, :client_id, :description, :status, :start_date)
  
  end
  
end
