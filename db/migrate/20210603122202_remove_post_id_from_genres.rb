class RemovePostIdFromGenres < ActiveRecord::Migration[5.2]
  def change
    remove_column :genres, :post_id, :integer
  end
end
