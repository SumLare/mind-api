class API::ViewsController < API::APIController
  before_action :set_viewable, only: [:create]

  def create
    @view = @viewable.views.build(user: current_user)

    if @view.save
      render @viewable, status: :created
    else
      render json: @view.errors, status: 422
    end
  end

  private

  def set_viewable
    @viewable = if params[:answer_id].present?
                  Answer.find(params[:answer_id])
                elsif params[:user_id].present?
                  User.find(params[:user_id])
                end
  end
end
