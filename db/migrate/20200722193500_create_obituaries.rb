class CreateObituaries < ActiveRecord::Migration[5.1]
  def change
    create_table :obituaries do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :city
      t.string :state
      t.string :description
      t.string :image_url

      t.timestamps
    end
  end
end
