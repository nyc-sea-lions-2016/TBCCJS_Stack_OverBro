post '/answers' do
  @answer = Answer.new(params[:answer])
  question = Question.find(@answer.question_id)
  if @answer.save

    redirect "/questions/#{answer.question_id}"
  else
    @answer_errors = "Invalid Answer"
    redirect '/'
  end
end
