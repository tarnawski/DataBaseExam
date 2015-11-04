class AddTestToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :test_id, :integer
  end
end

