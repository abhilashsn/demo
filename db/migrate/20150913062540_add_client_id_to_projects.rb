class AddClientIdToProjects < ActiveRecord::Migration
  def change
  	#add_column :projects, :client_id, :column_type after: 'column_name'
  	add_column :projects, :client_id, :integer
  end
end
