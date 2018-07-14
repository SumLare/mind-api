require 'test_helper'

class API::FollowingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @following = followings(:following)
  end

  test 'should get index' do
  end

  test 'should create view' do
    @following.destroy

    assert_difference 'Following.count' do
      post api_followings_url, params: { following: @following.attributes },
                               headers: { 'HTTP_AUTHORIZATION' => api_token }
    end

    assert_response :created
  end
end
