class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  # belongs_to :user # foreign_key: :user_id, class_name: User

  has_many :comments
  has_many :users, :through => :comments  
  # Remember to create a migration!
end
