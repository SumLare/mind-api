class API::QuestionsController < API::APIController
  before_action :set_question, only: [:destroy]

  def index
    @questions = current_user.questions
  end

  def create
    @question = Question.new(question_params.merge(user: current_user))

    if @question.save
      render :show, status: :created
    else
      render json: @question.errors, status: 422
    end
  end

  def destroy
    @question.destroy
    head :ok
  end

  private

  def question_params
    params.require(:question).permit(:content, :respondent_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
