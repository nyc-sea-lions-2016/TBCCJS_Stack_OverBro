post '/question/:id/vote' do
  @question = Question.find_by(id: params[:id])
  value = @question.points

  Vote.create(user_id: session[:user_id], voteable_id: params[:id], voteable_type: "Question")

end


post '/answers/:id/vote' do
  answer = Answer.find(params[:id])
  points = answer.points

  vote = Vote.new(user_id: session[:user_id], voteable_id: answer.id, voteable_type: "Answer")
  if params[:vote_type] == "Upvote"
    vote.value = 1
  else
    vote.value = -1
  end

  if request.xhr?
    if vote.save
      erb :'/answers/_answer_partial', layout: false, locals: {answer: answer}
    else
      @errors = "something went wrong, please try again"
    end
  else
    if vote.save
      redirect "/questions/#{answer.question.id}"
    else
      @errors = "something went wrong, please try again"
    end
  end
end
