get "/comment/new" do 
  @user=User.find(session[:user_id])
  @post=Post.find(params[:post_id])
  erb :comment
end

post "/comment/new" do 
  comment = Comment.create(params[:comment])
  redirect "/post/#{params[:comment][:post_id]}"
end

get "/comment/:id/edit" do
  @comment = Comment.find(params[:id])
  puts @comment.inspect
  erb :edit_comment
end

post "/comment/:id/edit" do
  comment = Comment.update(params[:id], content: params[:comment][:content])
  redirect "/post/#{comment.post.id}"
end

get "/comment/:id/delete" do
  comment = Comment.find(params[:id])
  post = comment.post
  Comment.delete(comment.id)
  
  redirect "/post/#{post.id}"
end