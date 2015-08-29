class CreateTestCenters < ActiveRecord::Migration
  def change
    create_table :test_centers do |t|
      t.string :name
      t.string :address
      t.string :position_lat
      t.string :position_lng
      t.float :review_point
      t.string :region_code
      
      t.timestamps null: false
    end
  end
end
