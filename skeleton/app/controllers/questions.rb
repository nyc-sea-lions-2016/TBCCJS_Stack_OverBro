#redirect
get '/' do
  redirect '/questions'
end

#index
get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

#new
get '/questions/new' do
  erb :'/questions/new'
end

#create
post '/questions' do
  question = Question.create(params[:question])
  redirect '/questions'
end

#show
get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'/questions/show'
end

#edit
get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  erb :'/questions/edit'
end

#update
put '/questions/:id' do
  @question = Question.find(params[:id])
  @question.update(params[:question])
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @errors = "I hate you"
    erb :"/questions/edit"
  end
end

#destroy
delete '/questions/:id' do
  @question = Question.find(params[:id])
  @question.destroy
redirect '/questions'
end
