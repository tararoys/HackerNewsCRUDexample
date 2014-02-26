require 'spec_helper'

describe User do
  it "should have a name" do
    tara = User.new(name:"Tara");
    expect(tara.name).to eq("Tara") 
  end
end
