require 'spec_helper'

describe Post do
      after do
        Post.delete_all
        User.delete_all
      end

      it "should have a title, a content, and a user id" do
        content = {
                  title: "First Post",
                  content: "Yay lots of content",
                  user_id: User.create(email: "tara@tara.com", password: "password").id
                 }
        first_post = Post.create(content)
        expect(first_post.title).to eq("First Post")
      end
    
end
