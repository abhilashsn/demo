class Task < ActiveRecord::Base
	belongs_to :project
	validate :check_date

	private
	def check_date
		if !self.due_date.nil? && self.due_date < Project.find(self.project_id).start_date 
			errors.add(:due_date, "Ivalid Date, Should be greater than project start date")
		end	
	end
end
