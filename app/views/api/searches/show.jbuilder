json.questions @questions do |question|
  json.partial! 'api/questions/question', question: question

  json.user do
    json.partial! 'api/users/user', user: question.user
  end

  if question.answer
    json.answer do
      json.partial! 'api/answers/answer', answer: question.answer
    end
  end
end

json.users @users do |user|
  json.partial! 'api/users/user', user: user
end
