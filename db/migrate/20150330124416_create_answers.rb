class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :student_id
      t.integer :question_id
      t.boolean :answer_a
      t.boolean :answer_b
      t.boolean :answer_c
      t.boolean :answer_d

      t.timestamps null: false
    end
  end
end
