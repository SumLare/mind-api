class API::FollowingsController < API::APIController
  before_action :set_following, only: [:destroy]

  def index
    @followings = current_user.following.with_attached_avatar
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
    head :no_content
  end

  private

  def following_params
    params.require(:following).permit(:followed_id)
  end

  def set_following
    followed = current_user.following.find(params[:id])
    @following = current_user.follower_relationship.find_by(followed: followed)
  end
end
