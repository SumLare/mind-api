require 'test_helper'

class API::UpvotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @upvote = upvotes(:upvote)
    @question = @upvote.upvotable
  end

  test 'should create upvote' do
    @upvote.destroy

    assert_difference 'Upvote.count' do
      post api_question_upvotes_url(@question), headers: { 'HTTP_AUTHORIZATION' => api_token }
    end

    assert_response :created
  end
end
