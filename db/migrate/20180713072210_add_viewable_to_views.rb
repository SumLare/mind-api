class AddViewableToViews < ActiveRecord::Migration[5.2]
  def change
    remove_reference :views, :answer, index: true
    add_reference :views, :viewable, polymorphic: true
  end
end
