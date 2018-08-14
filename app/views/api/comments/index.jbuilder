json.array! @comments do |comment|
  json.partial! 'api/comments/comment', comment: comment

  json.user do
    json.partial! 'api/users/user', user: comment.user
  end
end
