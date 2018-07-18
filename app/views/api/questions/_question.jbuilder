json.cache! question do
  json.extract! question, :id, :content, :respondent_id, :upvotes_count, :answered, :created_at
  json.upvote_id question.upvotes.find_by(user: current_user)&.id
end
