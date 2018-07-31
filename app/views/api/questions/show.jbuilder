json.partial! 'question', question: @question

json.user do
  json.partial! 'api/users/user', user: @question.user
end
