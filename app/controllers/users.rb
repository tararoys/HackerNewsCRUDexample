get '/users/login' do 
  erb :login
end

post '/users/login' do 

  user = User.find_by_email(params["user"]["email"])
  if user && user.password == params["user"]["password"]
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/login'
  end
end

get '/users/logout' do
  session[:user_id] = nil
  redirect '/' 
end

get "/users/signup" do 
  erb :signup
end

post '/users/signup' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/"
  else
    @errors = @user.errors.full_messages
    erb :signup
  end
end

get "/users/:id" do 
  @user = User.find(params[:id])
  erb :profile
end