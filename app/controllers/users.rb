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