json.cache! user do
  json.extract! user, :id, :first_name, :last_name, :email, :bio
  json.avatar_url attachment_url(user.avatar)
end
