class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |column|
      column.string :title
      column.text :source
      column.belongs_to :author 
      column.timestamps


    end
  end
end
