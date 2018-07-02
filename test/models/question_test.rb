require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  setup do
    @question = questions(:question)
  end

  test 'valid' do
    assert @question.valid?
  end

  test 'invalid without content' do
    @question.content = nil
    assert @question.invalid?
  end
end
