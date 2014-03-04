require 'spec_helper'

describe "Add name column to user table" do
  after do
    Post.delete_all
    User.delete_all
    Comment.delete_all
  end

  it ("should have a name column") do 
    #add column migration 
    #source: http://api.rubyonrails.org/classes/ActiveRecord/Migration.html

    zoe = User.create(  name: "zoe", email: "zoe@serenity.com", password: "password")
    expect(zoe.name).to eq("zoe")

  end

end
