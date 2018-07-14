class API::VerificationTokensController < API::APIController
  skip_before_action :restrict_access!
  before_action :set_user, only: [:update]

  def create
    @verification_token = VerificationToken.new(verification_token_params)

    if @verification_token.save
      render json: @verification_token, status: :created
    else
      render json: @verification_token.errors, status: 422
    end
  end

  def update
    if @verification_token.verify(update_verification_token_params[:code])
      @user.update(password: update_verification_token_params[:password])
      render 'api/users/show', status: :ok
    else
      head :forbidden
    end
  end

  private

  def verification_token_params
    params.require(:verification_token).permit(:email)
  end

  def update_verification_token_params
    params.require(:verification_token).permit(:token, :code, :password)
  end

  def set_user
    @verification_token = VerificationToken.find_by!(
      token: update_verification_token_params[:token]
    )
    @user = @verification_token.user
  end
end
