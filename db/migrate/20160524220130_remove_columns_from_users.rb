class RemoveColumnsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :email, :string
    remove_column :users, :screen_name, :string
    remove_column :users, :oauth_token_secret, :string
  end
end
