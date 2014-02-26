require 'spec_helper'

describe User do
  after do
    User.delete_all
  end

  it "should have a name" do
    tara = User.new(name:"Tara")
    expect(tara.name).to eq("Tara") 
  end

  it "should have a password_hash" do
    tara = User.new(name: "Tara", password_hash: "password")
    expect(tara.password_hash).to eq("password")
  end 

  it "should have a unique name" do 
    User.create(name: "admin")
    admin = User.new(name:"admin", password_hash:"password")
    expect{admin.save(validate: false)}.to raise_error(ActiveRecord::RecordNotUnique) #skipping ruby validations in order to raise database constraint error
  end

  it "should have a hashed password" do 

    tara = User.create(name:"Tara", password:"password")
    expect(tara.reload.password_hash).to_not eq("password")
    #expect(tara.reload.password_hash).to eq("some_different_hash_every_time")
    #this test above shows that even though I feed the same password in, I'll get a different hash out. This probably has to do with salting magic. 
    expect(tara.password).to eq("password") #password works due to bcrypt comparison magic. Yay bcrypt comparison magic!

  end

    it "should not have duplicate name" do
      # question: when do the validations occur?
      # According to alyssa, validations when save is called. So you can create an instance of the user object, but if that object is invalid, you can't save it to the database. 
      # does it stop models being created? (user 2 doesn't exist?)
      # Does it run on .save / .create?
      # Does it run on .new?

      u1 = User.create(name: "Debra", password: "1234")
      u2 = User.create(name: "Debra", password: "1234")
      expect(User.where(name: "Debra").count).to eq(1)
    end



end
