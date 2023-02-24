class RemoveParentIdFromChild < ActiveRecord::Migration[7.0]
  def change
    remove_column :responses, :form_id
  end
end
