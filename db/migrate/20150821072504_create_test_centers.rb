class CreateTestCenters < ActiveRecord::Migration
  def change
    create_table :test_centers do |t|
      t.string :name
      t.string :address
      t.string :position_lat
      t.string :position_lng
      t.string :region_code
      #평점
      t.float :location_point
      t.float :facility_point
      t.float :computer_point
      t.float :avg_point
      
      
      t.timestamps null: false
    end
  end
end
