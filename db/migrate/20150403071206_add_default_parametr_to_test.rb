class AddDefaultParametrToTest < ActiveRecord::Migration
  def change
   remove_column :tests, :number_of_questions
   remove_column :tests, :time
   remove_column :tests, :bdb
   remove_column :tests, :bd
   remove_column :tests, :dost

   add_column :tests, :number_of_questions, :integer, :default => 0
   add_column :tests, :time, :boolean, :default => false
   add_column :tests, :bdb, :integer, :default => 0
   add_column :tests, :bd, :integer, :default => 0
   add_column :tests, :dost, :integer, :default => 0 
end
end
