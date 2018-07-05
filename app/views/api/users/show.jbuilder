json.partial! 'user', user: @user

json.questions @user.questions_for_respondent do |question|
  json.partial! 'api/questions/question', question: question

  json.upvote do
    json.partial! 'api/upvotes/upvote', upvote: question.upvotes.find_by(user: @user)
  end
end
