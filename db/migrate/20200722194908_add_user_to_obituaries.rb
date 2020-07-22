class AddUserToObituaries < ActiveRecord::Migration[5.1]
  def change
    add_reference :obituaries, :user, foreign_key: true
  end
end
