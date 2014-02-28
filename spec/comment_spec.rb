require 'spec_helper'

describe Comment do
  it "should have user_id, a post_id, a time created, and a content" do
        user = User.create(email: "tara@tara.com", password: "password")
        post = Post.create( title: "First Post", content: "Yay lots of content",
                  user_id: user.id)

        comment_content = {
                  user_id: user.id, 
                  post_id: post.id,
                  content: "Yay lots of content"
                 }
        a_comment = Comment.create(comment_content)
        expect(a_comment.content).to eq("Yay lots of content")

  end 
end
