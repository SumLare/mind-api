class API::ReportsController < API::APIController
  def create
    @report = Report.new(report_params.merge(user: current_user))

    if @report.save
      render json: @report, status: :created
    else
      render json: @report.errors, status: 422
    end
  end

  private

  def report_params
    params.require(:report).permit(:content, :comment_id)
  end
end
