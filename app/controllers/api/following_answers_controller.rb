class API::FollowingAnswersController < API::APIController
  def index
    @questions = Question.left_outer_joins(:answer)
                         .where(user: current_user.following)
                         .where.not(answers: { id: nil }).page(params[:page]).per(10)
  end
end
