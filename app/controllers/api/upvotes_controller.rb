class API::UpvotesController < API::APIController
  before_action :set_upvotable, only: [:create]
  before_action :set_upvote, only: [:destroy]

  def create
    @upvote = @upvotable.upvotes.build(user: current_user)

    if @upvote.save
      render :show, status: :created
    else
      render json: @upvote.errors, status: 422
    end
  end

  def destroy
    authorize @upvote
    @upvote.destroy
    head :no_content
  end

  private

  def set_upvotable
    @upvotable = if params[:question_id].present?
                   Question.find(params[:question_id])
                 elsif params[:comment_id].present?
                   Comment.find(params[:comment_id])
                 end
  end

  def set_upvote
    @upvote = Upvote.find(params[:id])
  end
end
