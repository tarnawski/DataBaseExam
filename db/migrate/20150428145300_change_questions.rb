class ChangeQuestions < ActiveRecord::Migration
  def change
  remove_column :questions, :answer_a
  remove_column :questions, :answer_b
  remove_column :questions, :answer_c
  remove_column :questions, :answer_d

  remove_column :questions, :a_is_correct
  remove_column :questions, :b_is_correct
  remove_column :questions, :c_is_correct
  remove_column :questions, :d_is_correct

  add_column :questions, :query, :string
  end
end
