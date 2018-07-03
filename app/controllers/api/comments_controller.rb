class API::CommentsController < API::APIController
  before_action :set_answer, only: [:create]

  def create
    @comment = @answer.comments.build(comment_params.merge(user: current_user))

    if @comment.save
      render :show, status: :created
    else
      render json: @answer.errors, status: 422
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_answer
    @answer = Answer.find(params[:answer_id])
  end
end
