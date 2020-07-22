class AddRefreshTokentoUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :refresh_token, :string, :default => nil

  end
end
