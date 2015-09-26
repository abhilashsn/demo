
class Project < ActiveRecord::Base
	before_create :generate_project_code
	before_destroy :delete_all_tasks

	belongs_to :client
	has_many :tasks
	def details
		"#{id} - #{name} - #{status}"
	end
	
	validates_presence_of :name, :start_date, :client_id, :status
	validates_numericality_of :client_id
	validates_length_of :name, minimum:3
	validates_uniqueness_of :name

	private
		def generate_project_code
			self.project_code = "ABC-#{Random.rand(1000)}"
		end

		def delete_all_task
			Task.where('project_id = ?', self.id).delete_all
		end
end
