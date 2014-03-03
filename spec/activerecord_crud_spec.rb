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

  it "join table creation with the shovel operator" do
      # have a user that exists
      # create a post and stick it in the users posts. 
      # 
      # if I do the magic right, when I create a post, I don't have to include the user id because activerecord will add that whenI shovel
      
      tara = User.create(email: "tara@tara.com", password: "password")
        post_content = {
                  title: "First Post",
                  content: "Yay lots of content"
                 }
      tara.posts << Post.create(post_content)
      expect(tara.posts.count).to eq(1)
      
    end


  xit "basic find methods" do 
            tara = User.create(email: "tara@tara.com", password: "password")
            expect(User.find_by("tara@tara.com").email).to eq(tara.email)
            #find_by is a special method. The method name is activerecord magic  
  end
  
  it "basic where methods" do 
      tara = User.create(email: "tara@tara.com", password: "password")
      expect(User.where(email: "tara@tara.com").first.email).to eq (tara.email)
    end  
  pending "update"
    xit "basic update method" do 
    end
  pending "delete"

    xit "basid delete method" do 
    end
end
