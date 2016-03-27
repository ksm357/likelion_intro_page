class AddColumnToGuestPosts < ActiveRecord::Migration
  def change
    add_column :guest_posts, :user_id, :integer
  end
end
