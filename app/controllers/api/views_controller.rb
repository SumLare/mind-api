class API::ViewsController < API::APIController
  before_action :set_answer, only: [:create]

  def create
    @view = @answer.views.build(user: current_user)

    if @view.save
      render @answer, status: :created
    else
      render json: @view.errors, status: 422
    end
  end

  private

  def set_answer
    @answer = Answer.find(params[:answer_id])
  end
end
