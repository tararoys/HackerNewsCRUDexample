class User < ActiveRecord::Base
  # Remember to create a migration!
  
 validates :email, presence: {message: "Email is required"} 
 validates :email, :uniqueness => true
 
 validates :email, :format => {
          :with => /^[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]{2,5}$/,
          :message => "Email Format should be *@*.*"
        } 
  
 include BCrypt
 
 def password 
  @password ||= Password.new(password_hash)
 end

 def password=(new_password)
  @password = Password.create(new_password)  
  self.password_hash = @password
 end
end
