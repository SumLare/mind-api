json.questions @questions do |question|
  json.partial! 'api/questions/question', question: question

  json.partial! 'api/answers/answer', answer: question.answer if question.answer
end

json.users @users do |user|
  json.partial! 'api/users/user', user: user
end
