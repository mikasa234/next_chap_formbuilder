class DropFieldsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :fields
  end
end
