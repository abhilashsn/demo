class ClientsController < ApplicationController
   before_filter :authenticate_user!  
  def index
    @clients = current_user.clients
  end
  def new
    @clients = Client.new
  end
  def create
    @client = Client.new(client_params)
    @client.user_id = current_user.id
    if @client.save
      redirect_to client_path(@client.id)
    else 
      render action: 'new'
    end
  end
  
  def show
    begin
    @clients = current_user.admin ? Client.find(params[:id]) : current_user.clients.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_url, notice: "Record Does Not Exist"
  end
  end
    
  def edit 
    begin
    @client = current_user.clients.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_url, notice: "Record Does Not Exist"
  end
  end
  
  def update 
  
    @clients = clients.find(params[:id])
    if @clients.update_attributes(clients_params)
      redirect_to clients_path(@clients)
    else
      render action: "edit"
    end
  
  end
  
  def destroy
    @clients = Client.find(params[:id])
    @clients.destroy
    redirect_to clients_path
  end
    
    
   
  
  
  
  private 
  
  def client_params
    params[:client].permit(:name, :company, :email, :website)
  
  end
  
end
