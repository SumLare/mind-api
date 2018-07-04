module ApplicationHelper
  def attachment_url(attachment)
    rails_blob_url(attachment)
  rescue
    nil
  end
end
