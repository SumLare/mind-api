json.cache! ['popular', current_user], expires_in: 2.minutes do
  json.array! @users do |user|
    json.cache! ['feed', user], expires_in: 2.minutes do
      json.partial! 'api/users/user', user: user

      json.questions user.questions.includes(:answer) do |question|
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
    end
  end
end
