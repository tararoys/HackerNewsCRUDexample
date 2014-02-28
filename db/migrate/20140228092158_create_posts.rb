class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |column|
      column.string :title
      column.text :content
      column.integer :user_id
      
      column.timestamps
    end
  end
end
