get "/post/:id" do
  @post = Post.find(params[:id])
  erb :post
end