class SayController < ApplicationController
	
	def hello
		@client = Client.first
		# @clinet is an instance valiable, Client.first it will display only one clinet 
		@clients = Client.all

		@projects = Project.all

	end

	def goodbye

	end
end
