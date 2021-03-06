require 'test_helper'

class API::QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = questions(:question)
  end

  test 'should create question' do
    @question.destroy

    assert_difference 'Question.count' do
      post api_questions_url, params: { question: @question.attributes },
                              headers: { 'HTTP_AUTHORIZATION' => api_token }
    end

    assert_response :created
  end
end
