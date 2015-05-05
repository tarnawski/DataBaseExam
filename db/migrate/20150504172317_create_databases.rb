class CreateDatabases < ActiveRecord::Migration
  def change
    create_table :databases do |t|
      t.string :name
      t.text :comment
      t.string :adapter
      t.string :encoding
      t.string :host
      t.integer :pool
      t.string :username
      t.string :password
      t.string :database
      t.string :image_path

      t.timestamps null: false
    end
  end
end
