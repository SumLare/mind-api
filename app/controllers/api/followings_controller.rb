class API::FollowingsController < API::APIController
  before_action :set_following, only: [:destroy]

  def index
    @followings = current_user.following
  end

  def create
    @following = Following.new(following_params.merge(follower: current_user))

    if @following.save
      render @following, status: :created
    else
      render json: @following.errors, status: 422
    end
  end

  def destroy
    @following.destroy
    head :ok
  end

  private

  def following_params
    params.require(:following).permit(:followed_id)
  end

  def set_following
    @following = Following.find(params[:id])
  end
end
