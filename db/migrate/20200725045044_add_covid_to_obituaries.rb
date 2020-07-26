class AddCovidToObituaries < ActiveRecord::Migration[5.1]
  def change
    add_column :obituaries, :covid, :boolean, default: false 
  end
end
