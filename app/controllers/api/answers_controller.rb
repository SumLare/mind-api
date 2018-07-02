class API::AnswersController < API::APIController
  before_action :set_question, only: [:create]

  def create
    @answer = @question.answers.build(answer_params.merge(user: current_user))

    if @answer.save
      render :show, status: :created
    else
      render json: @answer.errors, status: 422
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:video)
  end

  def set_question
    @question = Question.find(params[:question_id])
  end
end
