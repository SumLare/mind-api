class API::PopularsController < API::APIController
  def show
    @users = User.joins(:answers)
                 .where('answers.created_at >= ?', 7.days.ago)
                 .order('answers.views_count desc')
                 .includes(:questions)
                 .with_attached_avatar
                 .limit(10)
  end
end
