#redirect
get '/' do
  redirect '/questions'
end

#index
get '/questions' do
  @questions = Question.order(updated_at: :desc)
  erb :'/questions/index'
end

#new
get '/questions/new' do
  erb :'/questions/new'
end

#create
post '/questions' do
  @question = Question.new(params[:question])
  if request.xhr?
    if @question.save
      erb :'/questions/_new_post', layout: false
    else
      @errors = @question.errors.full_messages
      erb :'/questions/index'
    end
  else
    if @question.save
      redirect '/questions'
    else
      @errors = @question.errors.full_messages
      erb :'/questions/index'
    end
  end
end

#show
get '/questions/:id' do
  @question = Question.find(params[:id])
  answers = @question.answers.order(:best_answer?, updated_at: :desc)
  erb :'/questions/show', locals: {answers: answers}
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
