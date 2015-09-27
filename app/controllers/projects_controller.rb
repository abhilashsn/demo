class ProjectsController < ApplicationController
  def index
    @project = Project.all
  end
  def new
    @project = Project.new
  end
  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to project_path(@project.id)
    else 
      render action: 'new'
    end
  end
  
  def show
    begin
    @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    redirect_to projects_path
  end
  end
    
  def edit 
    @project = Project.find(params[:id])
  end
  
  def update 
  
    @project = Project.find(params[:id])
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
