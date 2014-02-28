class Post < ActiveRecord::Base
  has_many :comments
  has_many :users, :through => :comments  
  # Remember to create a migration!
end
