class ChangeAnswer < ActiveRecord::Migration
  def change
  remove_column :answers, :answer_a
  remove_column :answers, :answer_b
  remove_column :answers, :answer_c
  remove_column :answers, :answer_d

  add_column :answers, :answer, :string
  end
end
