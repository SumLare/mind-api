json.questions @questions do |question|
  json.partial! 'api/questions/question', question: question

  json.user do
    json.partial! 'api/users/user', user: question.user
  end

  json.answer do
    json.partial! 'api/answers/answer', answer: question.answer
  end

  json.respondent do
    json.partial! 'api/users/user', user: question.respondent
  end
end

json.meta paginate(@questions)
