require 'spec_helper'

describe "Join Table Associations" do

      after do
        Post.delete_all
        User.delete_all
        Comment.delete_all
      end

    context "create associations" do 

      it "tests that all of the associations for the join table are set up correctly" do
        zoe = User.create(email: "zoe@serenity.com", password: "password")
        inara = User.create(email: "inara@serenity.com", password: "password")

        hate_the_alliance = Post.create(title: "I hate the alliance", content: "We will rise again.", user_id: zoe.id)
        i_said_dont = Post.create(title: "Don't come in my shuttle", content: "The exact words I used were don't", user_id: inara.id)


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

end
