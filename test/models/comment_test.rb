require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    @comment = comments(:comment)
  end

  test 'valid' do
    assert @comment.valid?
  end

  test 'invalid without content' do
    @comment.content = nil
    assert @comment.invalid?
  end
end
