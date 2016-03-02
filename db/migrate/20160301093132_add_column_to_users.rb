class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :string
    add_column :users, :introduction, :text
    add_column :users, :profile, :string
  end
end
