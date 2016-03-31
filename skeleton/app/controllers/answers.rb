post '/answers' do

  @answer = Answer.new(params[:answer])
  if @answer.save

    redirect "/questions/#{answer.question_id}"
  else
    redirect '/'
  end
end
