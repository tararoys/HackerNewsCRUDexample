class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |column|
      column.string :name, null: false
      column.string :email, null: false
      column.string :password_hash
    end

    #found at apidoc add_index
    #
    add_index(:users, :name, :unique => true)
    add_index(:users, :email, :unique => true)
  end

end
