json.array! @followings do |following|
  json.partial! 'api/users/user', user: following
  json.missed_answers_count following.missed_answers_count(current_user)
end
