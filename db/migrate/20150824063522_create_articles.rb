class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :test_center_id
      t.string :title
      t.string :testcenter
      t.text :content
      t.string :author
      
      #평점&코멘트
      t.float :location_point
      t.string :location_content
      t.float :facility_point
      t.string :facility_content
      t.float :computer_point
      t.string :computer_content
      t.float :avg_point
      
      
      t.timestamps null: false
    end
  end
end
