require 'spec_helper'

describe "Activerecord CRUD" do

    after do
      Post.delete_all
      User.delete_all
      Comment.delete_all
    end

    it "basic creation of individual records" do 

      tara = User.create(email: "tara@tara.com", password: "password")
      expect(tara.email).to eq("tara@tara.com")

      kori_info = {email: "kori@kori.com", 
                   password: "password"}
      kori = User.create(kori_info)

      expect(kori.email).to eq("kori@kori.com")
    end 


  pending "Read"
    xit "basic find methods" do 
    end
    xit "basic where methods" do 
    end  
  pending "update"
    xit "basic update method" do 
    end
  pending "delete"
    xit "basid delete method" do 
    end
end
