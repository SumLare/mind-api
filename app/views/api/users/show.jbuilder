json.partial! 'api/users/user', user: @user

json.questions @user.questions_for_respondent do |question|
  json.partial! 'api/questions/question', question: question
end
