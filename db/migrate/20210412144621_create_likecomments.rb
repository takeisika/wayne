class CreateLikecomments < ActiveRecord::Migration[5.2]
  def change
    create_table :likecomments do |t|
      t.integer :comment_id
      t.integer :user_id

      t.timestamps
    end
  end
end
