get "/comment/new" do 
  @user=User.find(session[:user_id])
  @post=Post.find(params[:post_id])
  erb :comment
end

post "/comment/new" do 
  comment = Comment.create(params[:comment])
  redirect "/post/#{params[:comment][:post_id]}"
end