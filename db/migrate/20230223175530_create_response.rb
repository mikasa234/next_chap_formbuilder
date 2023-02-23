class CreateResponse < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.json :data

      t.timestamps
    end
  end
end
