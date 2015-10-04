class ClientsController < ApplicationController
  before_filter :authenticate_user!  ,except: [:index]
	def index 
		@clients = current_user.clients
	end
	def new 
		@client = Client.new
	end
	def create
		@client = Client.new(client_params)
    @client.user_id = current_user.id
		if @client.save
			redirect_to clients_path
		else
			render action: 'new'
		end
	end

	def show
		begin
    @client = current_user.clients.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_url, notice: "Record Does Not Exist"
  end
	end

	def update
		@client = Client.find(params[:id])
		if @client.update_attributes(client_params)
			redirect_to client_path(@client)
		else
			render action: "edit"
		end
	end

	def destroy
		@client = Client.find(params[:id])
		@client.destroy
		redirect_to clients_path
	end

	def edit 
		begin
    @client = current_user.clients.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_url, notice: "Record Does Not Exist"
  end
	end








	private
	def client_params
	params[:client].permit(:name, :company, :email, :website)
	end

end
