require 'test_helper'

class ViewTest < ActiveSupport::TestCase
  setup do
    @view = views(:view)
  end

  test 'valid' do
    assert @view.valid?
  end
end
