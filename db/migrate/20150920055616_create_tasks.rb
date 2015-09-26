class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
    		t.string :name
    		t.date :due_date
    		t.string :project_id
    		t.boolean :is_completed, default: false
    		t.timestamps null: false
      t.timestamps
    end
  end
end
