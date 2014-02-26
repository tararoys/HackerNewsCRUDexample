require 'spec_helper'

describe User do
  it "should have a name" do
    tara = User.new(name:"Tara")
    expect(tara.name).to eq("Tara") 
  end

  it "should have a password_hash" do
    tara = User.new(name: "Tara", password_hash: "password")
    expect(tara.password_hash).to eq("password")
  end 
end
