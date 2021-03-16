class AddToTube < ActiveRecord::Migration[5.2]
  def change
    add_column :posts,:tube,:string
  end
end
