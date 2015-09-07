class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      
      t.integer :plus_count
      t.integer :minus_count

      t.timestamps null: false
    end
  end
end
