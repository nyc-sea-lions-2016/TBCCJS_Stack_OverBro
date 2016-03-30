get '/' do
  erb :index
end

get '/users/new' do
  @user = User.new

  erb :'users/new'
end

post '/users' do
  binding.pry
@user = User.new(params[:user])
  if @user.save
    redirect "/user/#{user.id}"
  else
    @errors = @user.errors.full_messages

    erb :'/users/new'
  end
end

