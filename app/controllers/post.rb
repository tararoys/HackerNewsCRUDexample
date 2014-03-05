get "/post/:id" do
  @post = Post.find(params[:id])
  @comments = @post.comments.order(:created_at).reverse_order
  erb :post
end