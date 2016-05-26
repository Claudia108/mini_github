class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :profile_pic, :string
    add_column :users, :followers, :int
    add_column :users, :following, :int
  end
end
