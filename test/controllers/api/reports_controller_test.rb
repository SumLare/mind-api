require 'test_helper'

class API::ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @report = reports(:report)
    @comment = @report.reportable
  end

  test 'should create report' do
    @report.destroy

    assert_difference 'Report.count' do
      post api_comment_reports_url(@comment), params: { report: @report.attributes },
                            headers: { 'HTTP_AUTHORIZATION' => api_token }
    end

    assert_response :created
  end
end
