get '/login' do
  erb  :'sessions/new'
end

post '/login' do
  user = User.find_by(username: params[:username])
  if user && user.authenticate(params[:password])
    session[:username_id] = username.id
    redirect '/'
  else
    @errors = ["Wrong username or password"]
    erb :'/sessions/new'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

