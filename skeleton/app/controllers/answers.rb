post '/answers' do
  @answer = Answer.new(params[:answer])
  if request.xhr?
    if @answer.save
      erb :'/answers/_answer_partial', layout: false, locals: {answer: @answer}
    else
      @answer_errors = "Invalid Answer"
      erb :'/questions/show'
    end
  else
    if @answer.save
      redirect "/questions/#{@answer.question_id}"
    else
      @answer_errors = "Invalid Answer"
      erb :'/questions/show'
    end
  end
end
