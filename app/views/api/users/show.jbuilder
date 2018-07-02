json.partial! 'user', user: @user

json.questions_for_respondent @user.questions_for_respondent do |question|
  json.partial! 'api/questions/question', question: question
end
