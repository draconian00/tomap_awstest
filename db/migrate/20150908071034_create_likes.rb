class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      
      t.integer :article_id
      t.string :click_like_person
      
      t.timestamps null: false
    end
  end
end
