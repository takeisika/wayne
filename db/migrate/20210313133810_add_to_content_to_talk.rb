class AddToContentToTalk < ActiveRecord::Migration[5.2]
  def change
    add_column :talks,:content,:text
  end
end
