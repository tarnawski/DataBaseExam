class DropTableStudentsAndResults < ActiveRecord::Migration
  def change
  drop_table :students
  drop_table :results
  end
end
