post '/question/:id/vote' do
  @question = Question.find_by(id: params[:id])
  points = @question.points

  Vote.create(session[:user_id], points + 1)

end

put '/votes/:id/' do

end




