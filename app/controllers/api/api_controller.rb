class API::APIController < ApplicationController
  include Pundit
  before_action :restrict_access!
  protect_from_forgery with: :null_session
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  attr_reader :current_user
  helper_method :current_user

  def restrict_access!
    return if restrict_access

    render json: { message: 'Invalid API Token' }, status: 401
  end

  def restrict_access
    authenticate_with_http_token do |token, _|
      @current_user ||= User.find_by_api_token(token)
    end
  end

  private

  def user_not_authorized
    head :forbidden
  end
end
