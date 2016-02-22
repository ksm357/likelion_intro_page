class CreateGuestPosts < ActiveRecord::Migration
  def change
    create_table :guest_posts do |t|

      t.timestamps null: false
    end
  end
end
