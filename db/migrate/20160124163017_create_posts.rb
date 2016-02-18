class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.integer :board_id
      t.string :title
      t.text :content
      t.integer :hits

      t.timestamps null: false
    end
  end
end
