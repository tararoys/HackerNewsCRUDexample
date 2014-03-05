get '/' do

  @posts = Post.all

  @user = User.find(session[:user_id]) if session[:user_id]
  # Look in app/views/index.erb
  erb :index
end
