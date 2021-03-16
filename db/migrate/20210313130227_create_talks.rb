class CreateTalks < ActiveRecord::Migration[5.2]
  def change
    create_table :talks do |t|
      t.integer :your_id
      t.integer :my_id

      t.timestamps
    end
  end
end
