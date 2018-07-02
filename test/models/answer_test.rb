require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  setup do
    @answer = answers(:answer)
  end

  test 'valid' do
    assert @answer.valid?
  end
end
