json.cache! answer do
  json.extract! answer, :id
  json.video_url attachment_url(answer.video)
end
