get "/post/:id" do
  @user = User.find(session[:user_id]) if session[:user_id] 
  @post = Post.find(params[:id])
  @comments = @post.comments.order(:created_at).reverse_order
  erb :post
end