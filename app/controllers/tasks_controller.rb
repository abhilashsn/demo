class TasksController < ApplicationController
	def create
		@task = Task.new(params_task)
		if @task.save
			redirect_to project_path(@task.project_id), notice: "Success fully created task"
	end
end




	private 

	def params_task
		params.require(:task).permit(:name, :due_date, :is_completed, :project_id)
	end
end
