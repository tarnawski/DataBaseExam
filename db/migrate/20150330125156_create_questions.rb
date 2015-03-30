class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :test_id
      t.text :content
      t.text :answer_a
      t.text :answer_b
      t.text :answer_c
      t.text :answer_d
      t.integer :correct

      t.timestamps null: false
    end
  end
end
