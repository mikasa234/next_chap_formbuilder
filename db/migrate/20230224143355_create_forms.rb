class CreateForms < ActiveRecord::Migration[7.0]
  def change
    create_table :forms do |t|
      t.string :title
      t.json :data
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
