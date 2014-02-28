class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |column|

      column.belongs_to :user
      column.belongs_to :post
      column.text :content

      column.timestamps 
    end

  end
end
