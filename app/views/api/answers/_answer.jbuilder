json.cache! answer do
  json.extract! answer, :id, :views_count
  json.video_url attachment_url(answer.video)
  json.viewed answer.viewed?(current_user)
end
