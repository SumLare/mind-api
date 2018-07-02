require 'test_helper'

class UpvoteTest < ActiveSupport::TestCase
  setup do
    @upvote = upvotes(:upvote)
  end

  test 'valid' do
    assert @upvote.valid?
  end
end
