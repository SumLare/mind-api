class Admin::ReportsController < Admin::AdminController
  def index
    @reports = Report.all
  end
end
