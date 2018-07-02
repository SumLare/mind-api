json.upvotable do
  json.extract! @upvote.upvotable, :id, :upvotes_count
end
