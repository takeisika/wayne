class RemoveColumnComment < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks,:comment,:text
  end
end
