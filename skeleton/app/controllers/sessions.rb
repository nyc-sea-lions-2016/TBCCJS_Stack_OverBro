  get '/login' do
  erb  :'sessions/new'
end

post '/login' do
  user = User.find_by(username: params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = ["Wrong username or password"]
    erb :'/sessions/new', layout: false
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

