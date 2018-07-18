json.array! @followings do |following|
  json.partial! 'api/users/user', user: following
  json.unviewed_answers_count current_user.unviewed_answers_count(following)
end
