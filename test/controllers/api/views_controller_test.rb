require 'test_helper'

class API::ViewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @view = views(:view)
    @answer = @view.viewable
  end

  test 'should create view' do
    @view.destroy

    assert_difference 'View.count' do
      post api_answer_views_url(@answer), params: { view: @view.attributes },
                            headers: { 'HTTP_AUTHORIZATION' => api_token }
    end

    assert_response :created
  end
end
