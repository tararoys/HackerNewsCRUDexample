require 'spec_helper'

describe Comment do

  after do
    Post.delete_all
    User.delete_all
    Comment.delete_all
  end

  it "should have author, a post_id, a time created, and a source" do
        user = User.create(name: "tara", email: "tara@tara.com", password: "password")
        post = Post.create( title: "First Post", source: "Yay lots of source",
                  user_id: user.id)

        comment_content = {
                  user_id: user.id, 
                  post_id: post.id,
                  content: "Yay lots of source"
                 }
        a_comment = Comment.create(comment_content)
        expect(a_comment.content).to eq("Yay lots of source")

  end 
end
