class RemoveChildIdFromParent < ActiveRecord::Migration[7.0]
  def change
    remove_column :forms, :response_id
  end
end
