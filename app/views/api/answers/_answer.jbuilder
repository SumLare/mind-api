json.cache! answer do
  json.extract! answer, :id
  json.video_url rails_blob_url(answer.video)
end
