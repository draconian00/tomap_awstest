class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :test_center_id
      t.string :title
      t.string :testcenter
      t.string :content
      
      #평점
      t.float :location_point
      t.float :facility_point
      t.float :computer_point
      t.float :avg_point
      
      
      t.timestamps null: false
    end
  end
end
