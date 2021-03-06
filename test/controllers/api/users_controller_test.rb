require 'test_helper'

class API::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:foo)
    @user.avatar.attach(io: File.open(fixture_path + 'files/blank.jpg'), filename: 'blank.jpg')
  end

  test 'should get show' do
    get api_user_path(@user), headers: { 'HTTP_AUTHORIZATION' => api_token }
    assert_response :success
  end

  test 'should create user' do
    @user.destroy

    assert_difference 'User.count' do
      post api_users_url, params: {
        user: @user.attributes.merge(
          password: SecureRandom.hex,
          avatar: fixture_file_upload(fixture_path + 'files/blank.jpg')
        )
      }
    end

    assert_response :created
  end

  test 'should update user' do
    new_name = 'Another name'
    patch api_user_path(@user), params: { user: { first_name: new_name } },
                                headers: { 'HTTP_AUTHORIZATION' => api_token }
    assert_response :ok
    assert_equal new_name, @user.reload.first_name
  end
end
