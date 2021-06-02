class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :post_image_id
      t.string :post_title
      t.text :opinion

      t.timestamps
    end
  end
end
