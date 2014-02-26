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

  
end
