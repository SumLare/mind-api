class API::UsersController < API::APIController
  skip_before_action :restrict_access!, only: [:create, :show]
  before_action :restrict_access!, only: [:show], if: -> { token_present? || params[:id].blank? }
  before_action :set_user, only: [:show, :update]

  def show
    @questions = @user.questions_for_respondent.page(params[:page]).per(5)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render status: :created
    else
      render json: @user.errors, status: 422
    end
  end

  def update
    if @user.update(user_params)
      render :show, status: :ok
    else
      render json: @user.errors, status: 422
    end
  end

  private

  def set_user
    @user = params[:id].present? ? User.find(params[:id]) : current_user
  end

  def user_params
    params
      .require(:user)
      .permit(
        :first_name, :last_name, :email, :password,
        :avatar, :bio, :device_token, :current_password
      )
  end
end
