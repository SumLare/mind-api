class API::PopularsController < API::APIController
  include ApplicationHelper

  def show
    @questions = Question.includes(:answer, :user)
                         .joins(:answer)
                         .where('answers.created_at >= ?', 7.days.ago)
                         .order('answers.views_count desc')
                         .preload(answer: {video_attachment: :blob},
                          user: {avatar_attachment: :blob}).page(params[:page]).per(10)

    @users = User.where(id: @questions.pluck(:respondent_id))
                 .where.not(id: current_user.id)
                 .with_attached_avatar
                 .limit(10)
  end
end
