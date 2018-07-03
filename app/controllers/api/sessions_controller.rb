class API::SessionsController < API::APIController
  skip_before_action :restrict_access!, only: [:create]
  before_action :set_user, only: [:create]

  def create
    if @user&.authenticate(params[:password])
      render 'api/users/create', status: :ok
    else
      render json: { message: 'Invalid credentials' }, status: 401
    end
  end

  private

  def set_user
    @user = User.find_by(email: params[:email])
  end
end
