class AddFormToResponses < ActiveRecord::Migration[7.0]
  def change
    add_reference :responses, :form, null: false, foreign_key: true
  end
end
