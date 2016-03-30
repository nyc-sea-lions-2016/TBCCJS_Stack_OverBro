get '/' do
  redirect '/questions'
end

get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

get '/questions/new' do
  erb :'/questions/new'
end

post '/questions' do
  question = Question.create(params[:question])
  redirect '/questions'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'/questions/show'
end
