class API::PopularsController < API::APIController
  include ApplicationHelper

  def show
    @users = User.where.not(id: current_user.id)
                 .joins(:answers)
                 .where('answers.created_at >= ?', 7.days.ago)
                 .group('users.id, answers.views_count')
                 .order('answers.views_count desc')
                 .with_attached_avatar
                 .limit(10)

    @questions = Question.includes(:answer, :user)
                         .preload(answer: {video_attachment: :blob},
                          user: {avatar_attachment: :blob}).page(params[:page]).per(10)
  end
end
