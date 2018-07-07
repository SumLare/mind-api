class API::ReportsController < API::APIController
  before_action :set_reportable, only: [:create]

  def create
    @report = @reportable.reports.build(report_params.merge(user: current_user))

    if @report.save
      render json: @report, status: :created
    else
      render json: @report.errors, status: 422
    end
  end

  private

  def report_params
    params.require(:report).permit(:content, :category)
  end

  def set_reportable
    @reportable = if params[:answer_id].present?
                    Answer.find(params[:answer_id])
                  elsif params[:comment_id].present?
                    Comment.find(params[:comment_id])
                  end
  end
end
