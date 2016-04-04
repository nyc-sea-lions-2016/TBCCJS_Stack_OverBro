post '/question/:id/vote' do
  @question = Question.find_by(id: params[:id])
  value = @question.points

  vote = Vote.new(user_id: session[:user_id], voteable_id: params[:id], voteable_type: "Question")

  if params[:vote_type] == "Upvote"
    vote.value = 1
  else
    vote.value = -1
  end
  vote.save
  redirect '/'
end


post '/answers/:id/vote' do
  answer = Answer.find(params[:id])
  points = answer.points
  question = answer.question

  if Vote.find_by(user_id: session[:user_id], voteable_id: params[:id])
    @answer_vote_errors = "You've already voted"
    erb :'/questions/show', locals: {question: question, answers: question.answers}
  else
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
end

post '/comments/:id/vote' do
  comment = Comment.find(params[:id])
  points = comment.points
  commentable_class = comment.commentable_type

  if commentable_class == "Question"
    question = comment.commentable
    answers = question.answers
  else
    answer = comment.commentable
    question = answer.question
  end

  if Vote.find_by(user_id: session[:user_id], voteable_id: params[:id])
    @comment_vote_errors = "You've already voted"
    erb :'/questions/show', locals: {question: question, answers: question.answers}
  else
    vote = Vote.new(user_id: session[:user_id], voteable_id: comment.id, voteable_type: "Comment")

    if params[:vote_type] == "Upvote"
      vote.value = 1
    else
      vote.value = -1
    end

    if request.xhr?
      if vote.save
        erb :'/comments/_new_comment', layout: false, locals: {question: question, answer: answer}
      else
        @errors = "something went wrong, please try again"
        erb :'/questions/show', locals: {question: question, answers: question.answers}
      end
    else
      if vote.save
        redirect "/questions/#{question.id}"
      else
        @errors = "something went wrong, please try again"
        erb :'/questions/show', locals: {question: question, answers: question.answers}
      end
    end
  end
end
