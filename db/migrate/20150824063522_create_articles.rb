class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :test_center_id
      t.string :title
      t.string :testcenter
      t.string :content
      t.integer :point
      
      #조회수
      
      
      t.timestamps null: false
    end
  end
end
