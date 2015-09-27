class ClientsController < ApplicationController
  
  def index
  @clients = Client.all
  end
  
  def new
    @client = Client.new 
  end
  
  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path
    else
      render action: "new"
    end
  end
  
  def show
    @client = Client.find(params[:id])
  end
    
    
    
    private
    def client_params
      params[:client].permit(:name, :company, :email, :website)
    end
  end  
    
