class CreateHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtags do |t|
      t.string :hashname
      t.integer :post_id

      t.timestamps
    end
  end
end
