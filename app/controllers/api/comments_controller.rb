class API::CommentsController < API::APIController
  before_action :set_answer, only: [:index, :create]
  before_action :set_comment, only: [:destroy]
  skip_before_action :restrict_access!, only: [:index]

  def index
    @comments = @answer.comments
  end

  def create
    @comment = @answer.comments.build(comment_params.merge(user: current_user))

    if @comment.save
      render :show, status: :created
    else
      render json: @answer.errors, status: 422
    end
  end

  def destroy
    authorize @comment
    @comment.destroy
    head :no_content
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_answer
    @answer = Answer.find(params[:answer_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
