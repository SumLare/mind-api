json.cache! comment do
  json.extract! comment, :id, :content, :answer_id, :upvotes_count
  json.upvote_id comment.upvotes.find_by(user: current_user)&.id
end
