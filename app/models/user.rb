class User < ActiveRecord::Base
  # Remember to create a migration!
  # 

  has_many :comments
  has_many :posts, :through => :comments  
  
 validates :email, presence: {message: "Email is required"} 
 validates :email, :uniqueness => true
 
 validates :email, :format => {
          :with => /^[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]{2,5}$/,
          :message => "Email Format should be *@*.*"
        } 
 validates :password, presence: {message: "You must have a password"}
  
 include BCrypt
 
 def password 
  @password ||= Password.new(password_hash)
 end

 def password=(new_password)
  @password = Password.create(new_password)  
  self.password_hash = @password
 end
end
