require 'spec_helper'

describe User do
  after do
    User.delete_all
  end

  it "should have an email" do
    tara = User.new(email:"tara@tara.com")
    expect(tara.email).to eq("tara@tara.com") 
  end

  it "should have a password_hash" do
    tara = User.new(email: "tara@tara.com", password: "password")
    expect(tara.password).to eq("password")
  end 

  it "should have a unique email" do 
    User.create(email: "admin@admin.com", password: "password")
    admin = User.new(email:"admin@admin.com", password: "password")
    expect{admin.save(validate: false)}.to raise_error(ActiveRecord::RecordNotUnique) #skipping ruby validations in order to raise database constraint error
  end

  it "should have a hashed password" do 

    tara = User.create(email:"tara@tara.com", password:"password")
    expect(tara.reload.password_hash).to_not eq("password")
    #expect(tara.reload.password_hash).to eq("some_different_hash_every_time")
    #this test above shows that even though I feed the same password in, I'll get a different hash out. This probably has to do with salting magic. 
    expect(tara.password).to eq("password") #password works due to bcrypt comparison magic. Yay bcrypt comparison magic!

  end

    it "should not have duplicate email" do
      # question: when do the validations occur?
      # According to alyssa, validations when save is called. So you can create an instance of the user object, but if that object is invalid, you can't save it to the database. 
      # does it stop models being created? (user 2 doesn't exist?)
      # Does it run on .save / .create?
      # Does it run on .new?

      u1 = User.create(email: "Debra@debra.com", password: "1234")
      u2 = User.create(email: "Debra@debra.com", password: "1234")
      expect(User.where(email: "Debra@debra.com").count).to eq(1)
    end

    it "should be an actual email" do 
      u1 = User.create(email: "tara", password: "password");
      expect(u1.valid?).to eq(false);

      u2 = User.create(email: "tara@tara.com",  password: "password");

      expect(u2.valid?).to eq(true);
    end 

    it "You should have an email" do 
      u1 = User.create(password: "password");

      expect(u1.errors[:email][0]).to eq("Email is required");
      # expect {User.create(password: "password")}.to raise_error "hello"
    
    end 

    it "You should have a password" do 
      
      expect{User.create(email: "tara@tara.com")}.to raise_error BCrypt::Errors::InvalidHash
    end





end
