class CreateTablePostComments < ActiveRecord::Migration[7.0]
  def change
    create_table :post_comments do |t|
      t.string :title, null: false
      t.text :body
      t.integer :post_id
      t.timestamps
    end
  end
end
