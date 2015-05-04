class ChangeTests < ActiveRecord::Migration
  def change
  remove_column :tests, :single_test
  remove_column :tests, :time
  add_column :tests, :database, :integer
  end
end
