class Client < ActiveRecord::Base
	has_many :projects
  belongs_to :user
	def details
		"#{id} - #{name} - #{company} - #{email}"
	end

	def list_projects
		Project.where('client_id = ?', self.id)
	end
	validates_presence_of :name, :company
	#validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	validates_uniqueness_of :email

end
