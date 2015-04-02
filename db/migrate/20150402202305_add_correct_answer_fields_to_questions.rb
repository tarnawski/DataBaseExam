class AddCorrectAnswerFieldsToQuestions < ActiveRecord::Migration
  def change
   add_column :questions, :a_is_correct, :boolean, :default => false
   add_column :questions, :b_is_correct, :boolean, :default => false
   add_column :questions, :c_is_correct, :boolean, :default => false
   add_column :questions, :d_is_correct, :boolean, :default => false

   remove_column :questions, :correct
  end
end
