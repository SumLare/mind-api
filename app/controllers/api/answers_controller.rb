class API::AnswersController < API::APIController
  before_action :set_question, only: [:create]

  def create
    @answer = @question.build_answer(video: params[:video])

    if @answer.save
      render @answer, status: :created
    else
      render json: @answer.errors, status: 422
    end
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end
end
