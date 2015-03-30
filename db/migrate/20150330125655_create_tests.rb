class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :name
      t.boolean :available
      t.integer :user_id
      t.string :number_of_questions
      t.boolean :random
      t.integer :time
      t.boolean :single_test
      t.boolean :standard_score
      t.integer :bdb
      t.integer :db
      t.integer :dost

      t.timestamps null: false
    end
  end
end
