class API::UpvotesController < API::APIController
  before_action :set_upvotable, only: [:create]

  def create
    @upvote = @upvotable.upvotes.build(user: current_user)

    if @upvote.save
      render :show, status: :created
    else
      render json: @upvote.errors, status: 422
    end
  end

  private

  def set_upvotable
    @upvotable = if params[:question_id].present?
                   Question.find(params[:question_id])
                 elsif params[:comment_id].present?
                   Comment.find(params[:comment_id])
                 end
  end
end
