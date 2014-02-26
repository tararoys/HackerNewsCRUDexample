class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |column|
      column.string :name
      column.string :password_hash
    end

    #found at apidoc add_index
    #
    add_index(:users, :name, :unique => true)
  end

end
