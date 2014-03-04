require 'spec_helper'

describe Post do
      after do
        Post.delete_all
        User.delete_all
      end

      it "should have a title, a source, and a user id" do
        source = {
                  title: "First Post",
                  source: "Yay lots of source",
                  author: User.create(name: "tara", email: "tara@tara.com", password: "password")
                 }
        first_post = Post.create(source)
        expect(first_post.title).to eq("First Post")
      end

end
