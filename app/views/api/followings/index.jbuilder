json.array! @followings do |user|
  json.partial! 'api/users/user', user: user
  json.unviewed_answers_count current_user.unviewed_answers_count(user)

  json.answers user.answers do |answer|
    json.partial! 'api/answers/answer', answer: answer

    json.question do
      json.partial! 'api/questions/question', question: answer.question
    end
  end
end
