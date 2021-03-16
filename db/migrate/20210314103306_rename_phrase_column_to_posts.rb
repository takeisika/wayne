class RenamePhraseColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :phrase, :title
  end
end
