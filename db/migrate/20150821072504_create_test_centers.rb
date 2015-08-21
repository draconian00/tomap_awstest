class CreateTestCenters < ActiveRecord::Migration
  def change
    create_table :test_centers do |t|
      t.string :name
      t.string :address
      t.string :position
      
      t.timestamps null: false
    end
  end
end
