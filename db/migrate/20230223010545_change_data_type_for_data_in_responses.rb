class ChangeDataTypeForDataInResponses < ActiveRecord::Migration[7.0]
  def change
    remove_column :responses, :data
    add_column :responses, :data, :text
  end
end
