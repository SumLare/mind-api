require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @report = reports(:report)
  end

  test 'valid' do
    assert @report.valid?
  end
end
