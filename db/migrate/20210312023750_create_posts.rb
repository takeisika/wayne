class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :phrase
      t.integer :user_id

      t.timestamps
    end
  end
end
