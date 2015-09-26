class AddProjectCodeToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :project_code, :string
  end
end
