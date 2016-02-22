class CreateGuestPosts < ActiveRecord::Migration
  def change
    create_table :guest_posts do |t|

      t.string :name
      t.string :encrypted_password
      t.text :content
      t.boolean :is_secret

      t.timestamps null: false
    end
  end
end
