get '/answers/:id/comments/new' do
  if request.xhr?
    answer = Answer.find(params[:id])
    erb :'/comments/_answer_comment_form', layout: false, locals: {answer: answer}
  else
    redirect '/questions'
  end
end

post '/comments' do
  comment = Comment.new(params[:comment])
    if request.xhr?
      if comment.save
        erb :'/comments/_new_comment', layout: false, locals: {comment: comment}
      else
        @q_comment_errors = "Invalid comment!"
        erb :'/questions/show'
      end
    end
end
