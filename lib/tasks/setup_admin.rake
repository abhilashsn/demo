desc "used setup admin users"
task :setup_admin => :environment do
	User.create(email: "admin@gmail.com", password: "admin123", admin: true)
end