10.times do 
	client = Client.new
	client.name = Faker::Name.name
	client.company = Faker::Company.name
	client.email = Faker::Internet.email
	client.website = Faker::Internet.domain_name
	client.save
end

40.times do
	project = Project.new
	project.name = Faker::App.name
	project.description = Faker::Lorem.paragraph
	project.status = ["new", "completed", "on-going"].shuffle.first
	project.start_date = Faker::Date.between(Date.today - 2.years, Date.today)
	project.client_id = Client.order("RANDOM()").first.id
	project.save
end

300.times do
	 task = Task.new
	 task.name = ["Web Desgin", "logo desgin", "development", "testing"].shuffle.first
	 task.project_id = Project.order("RANDOM()").first.id   		#task.project_id=[1..300]shuffle.first
	 task.due_date = Faker::Date.between(Project.find(task.project_id).start_date, Date.today + 6.months)	#task.due_date = Date.today + Random.rand(100).days
	 task.is_completed = [true,false].shuffle.first
	 task.save
end

#another method without faker we add data