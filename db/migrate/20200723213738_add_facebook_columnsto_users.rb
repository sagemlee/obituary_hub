class AddFacebookColumnstoUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :fbid, :string
    add_column :users, :token, :string
  end
end
