require 'test_helper'

class API::AnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @answer = answers(:answer)
    @question = questions(:question)
  end

  test 'should create answer' do
    @answer.destroy

    assert_difference 'Answer.count' do
      post api_question_answer_url(@question), params: {
        answer: @answer.attributes.merge(
          video: fixture_file_upload(fixture_path + 'files/blank.jpg')
        )
      }, headers: { 'HTTP_AUTHORIZATION' => api_token }
    end

    assert_response :created
  end
end
