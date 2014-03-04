require 'spec_helper'

describe "Associations" do

      after do
        Post.delete_all
        User.delete_all
        Comment.delete_all
      end

    context "create associations" do 

      it "tests that all of the associations for the join table are set up correctly" do
        zoe = User.create(name: "zoe", email: "zoe@serenity.com", password: "password")
        inara = User.create(name: "inara", email: "inara@serenity.com", password: "password")

        hate_the_alliance = Post.create(title: "I hate the alliance", source: "We will rise again.", author: zoe)
        i_said_dont = Post.create(title: "Don't come in my shuttle", source: "The exact words I used were don't", author: inara)


        zoe_hates_alliance = Comment.create(user_id: zoe.id, post_id: hate_the_alliance.id, content: "You have a problem with your brain being missing")
        zoe_knows_ruby = Comment.create(user_id: zoe.id, post_id: i_said_dont.id, content: "You tell the captain, ambassador.")

        inara_likes_alliance_money = Comment.create(user_id: inara.id, post_id: hate_the_alliance.id, content: "Sadly, they have the money. ") 
        inara_hates_mal = Comment.create(user_id: inara.id, post_id: i_said_dont.id, content: "Why is it so hard to understand this basic rule?") #for some reason, inara's id is being defined as nil in the database
      
        
        expect(zoe.posts.count).to eq(2)
        expect(zoe.comments.count).to eq(2)

        expect(hate_the_alliance.users.count).to eq(2)
        expect(hate_the_alliance.comments.count).to eq(2)

      end
    end
    
    xit "Does creating post and shoveling it into user automatically set the user id?" do 
      #source http://www.davidverhasselt.com/set-attributes-in-activerecord/
      tara = User.create(name: "tara", email: "tara@tara.com", password: "password")
      post_source = {
                  title: "First Post",
                  source: "Yay lots of source"
                 }
      tara.posts << Post.create(post_source)
      post = Post.first
      expect(Post.all.count).to eq(1)
      expect(post.author).not_to eq(nil)
      expect(post.users.first.id).to eq(tara.id)
      expect(tara.posts.first.title).to eq("First Post")
      expect(post.user.email).to eq("tara@tara.com")
 
    end

    it ("a basic one to many relationshop where the forieign key is renamed") do 
      zoe = User.create(name: "zoe", email: "zoe@serenity.com", password: "password")
      post = Post.create(title: "I hate the alliance", source: "We will rise again.", author: zoe)
      
      # expect(zoe.posts.count).to eq(1)
      expect(post.author.name).to eq("zoe")

    end 

end
