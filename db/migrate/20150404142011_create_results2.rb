class CreateResults2 < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :student_id
      t.integer :test_id
      t.integer :points
      t.float :mark

      t.timestamps null: false
    end
  end
end
