class AddReportableToReports < ActiveRecord::Migration[5.2]
  def change
    add_reference :reports, :reportable, polymorphic: true, index: true
    remove_reference :reports, :comment, index: true, foreign_key: true
  end
end
