class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.string :status_id
      t.string :user_id

      t.timestamps
    end
  end
end
