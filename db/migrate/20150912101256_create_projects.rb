class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t| 
    	t.string :name
    	t.text :description
    	t.string :status
    	t.date :start_date

      t.timestamps null:false
      #t.datetime :created_at
      #t.datetime :updated_at
    end
  end
end
