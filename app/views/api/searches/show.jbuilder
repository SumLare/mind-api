json.questions @questions do |question|
  json.partial! 'api/questions/question', question: question

  json.cache! question.answer do
    json.partial! 'api/answers/answer', answer: question.answer
  end
end

json.users @users do |user|
  json.partial! 'api/users/user', user: user
end
