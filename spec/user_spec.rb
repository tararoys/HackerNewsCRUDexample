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
    expect{User.create(name:"admin", password_hash:"password")}.to raise_error(ActiveRecord::RecordNotUnique)
  end

  it "should have a hashed password" do 

    tara = User.create(name:"Tara", password:"password")
    expect(tara.reload.password_hash).to eq("password")
    #expect(tara.reload.password_hash).to eq("some_different_hash_every_time")
    #this test above shows that even though I feed the same password in, I'll get a different hash out. This probably has to do with salting magic. 
    expect(tara.password).to eq("password") #password works due to bcrypt comparison magic. Yay bcrypt comparison magic!

  end

end
