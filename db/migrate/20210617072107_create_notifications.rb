class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id, null: false
      t.integer :visited_id, null: false
      t.integer :chat_id
      t.integer :room_id
      t.integer :post_id
      t.integer :post_comment_id
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end

    add_index :notifications, :visitor_id
    add_index :notifications, :visited_id
    add_index :notifications, :chat_id
    add_index :notifications, :room_id
    add_index :notifications, :post_id
    add_index :notifications, :post_comment_id
  end
end
