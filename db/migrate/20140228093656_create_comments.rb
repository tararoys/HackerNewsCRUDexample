class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |column|

      column.integer :user_id
      column.integer :post_id
      column.text :content

      column.timestamps 
    end

  end
end
