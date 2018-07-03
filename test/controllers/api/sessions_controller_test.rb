require 'test_helper'

class API::SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:foo)
  end

  test 'should authenticate' do
    post api_sessions_url, params: { email: @user.email, password: 'password' }

    assert_response :success
  end

  test 'should not authenticate' do
    post api_sessions_url, params: { email: @user.email, password: SecureRandom.hex }

    assert_response 401
  end
end
