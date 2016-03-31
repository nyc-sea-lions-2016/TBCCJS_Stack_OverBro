post '/comments' do
  comment = Comment.new(params[:comment])
  if comment.save
    erb :'/comments/_new_comment', layout: false, locals: {comment: comment}
  end
end
