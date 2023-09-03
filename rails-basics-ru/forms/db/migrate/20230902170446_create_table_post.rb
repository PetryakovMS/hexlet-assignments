class CreateTablePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.string :summary
      t.boolean :published
      t.timestamps
    end
  end
end