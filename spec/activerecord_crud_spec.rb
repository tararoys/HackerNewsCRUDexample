require 'spec_helper'

describe "Activerecord CRUD" do

  after do
    Post.delete_all
    User.delete_all
    Comment.delete_all
  end

  it "basic creation of individual records" do 

    tara = User.create(name: "tara", email: "tara@tara.com", password: "password")
    expect(tara.email).to eq("tara@tara.com")

    kori_info = {name: "kori",
                  email: "kori@kori.com", 
                 password: "password"}
    kori = User.create( kori_info)

    expect(kori.email).to eq("kori@kori.com")
  end 

  it "join table creation with the shovel operator" do
    # have a user that exists
    # create a post and stick it in the users posts. 
    # 
    # if I do the magic right, when I create a post, I don't have to include the user id because activerecord will add that whenI shovel
    
    tara = User.create(name: "tara", email: "tara@tara.com", password: "password")
    post_content = {
      title: "First Post",
      content: "Yay lots of content"
     }
    tara.posts.create(post_content)
    expect(tara.posts.count).to eq(1)   
  end


  it "basic find methods" do
     #there is a find, find takes an id      
     tara = User.create(name: "tara", email: "tara@tara.com", password: "password")
     expect(User.find_by_email("tara@tara.com").email).to eq(tara.email)
     
     #find_by is a special method. The method name is activerecord magic
     #find by returns the first matching thing. use this for unique things.  
  end
  
  it "basic where methods" do 
    tara = User.create(name: "tara", email: "tara@tara.com", password: "password")
    expect(User.where(email: "tara@tara.com").first.email).to eq (tara.email)
    #where is for more than one thing.  
  end  

  describe "#update" do
    before do
      
    end

    it "basic update method" do 
      #source: http://apidock.com/rails/ActiveRecord/Base/update/class
      tara = User.create(name: "tara", email: "tara@tara.com", password: "password")
      post_content = { title: "First Post", content: "Yay lots of content" }
      post = tara.posts.create(post_content)

      Post.update(post.id, title: "Randall Munroe hates your first post")

      post = Post.first
      expect(post.title).to eq("Randall Munroe hates your first post");
    end

    xit "basic update method #2" do 
      #source: http://edgeguides.rubyonrails.org/active_record_basics.html#update
      tara = User.create(name: "tara", email: "tara@tara.com", password: "password")
      post_content = { title: "First Post", content: "Yay lots of content" }
      tara.posts << Post.create(post_content)
      post = Post.first
      post.update(title: "hello world") 
      expect(post.title).to eq("hello world");
    end

    it "basic update method #3" do 
      #source http://www.davidverhasselt.com/set-attributes-in-activerecord/
      tara = User.create(name: "tara", email: "tara@tara.com", password: "password")
      post_content = { title: "First Post", content: "Yay lots of content" }
      post = tara.posts.create(post_content)
      post.title = "Changing record"
      expect(post.title).to eq("Changing record");
    end    

    it "basic update method #4" do 
      #source: http://edgeguides.rubyonrails.org/active_record_basics.html#update
       tara = User.create(name: "tara", email: "tara@tara.com", password: "password")
      post_content = {
                  title: "First Post",
                  content: "Yay lots of content"
                 }
      tara.posts << Post.create(post_content)
      post = Post.first
      post.update_attributes(title: "hello world") 
      expect(post.title).to eq("hello world");
    end
  end

    

  it "basic delete method"
end
