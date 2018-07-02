json.cache! user do
  json.extract! user, :id, :first_name, :last_name, :email, :bio
  json.avatar_url rails_blob_url(user.avatar) if user.avatar
end

