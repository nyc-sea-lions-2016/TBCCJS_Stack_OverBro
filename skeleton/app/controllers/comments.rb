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
