module ApplicationHelper
  def attachment_url(attachment)
    rails_blob_url(attachment)
  rescue
    nil
  end

  def paginate(scope, default_per_page = 10)
    collection = scope.page(params[:page]).per(default_per_page)

    current, total, per_page = collection.current_page, collection.total_pages, collection.limit_value

    return {
      current:  current,
      previous: (current > 1 ? (current - 1) : nil),
      next:     (current == total ? nil : (current + 1)),
      per_page: per_page,
      pages:    total,
      count:    collection.total_count
    }
  end
end
