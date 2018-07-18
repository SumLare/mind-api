class API::PopularsController < API::APIController
  def show
    @users = User.where.not(id: current_user.id)
                 .left_joins(:answers)
                 .where('answers.created_at >= ?', 7.days.ago)
                 .group('users.id, answers.views_count')
                 .order('answers.views_count desc')
                 .with_attached_avatar
                 .limit(10)
  end
end
