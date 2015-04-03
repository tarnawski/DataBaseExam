class ChangeDefaultParametrToTest < ActiveRecord::Migration
  def change
   remove_column :tests, :time
   add_column :tests, :time, :integer, :default => 0
  end
end
