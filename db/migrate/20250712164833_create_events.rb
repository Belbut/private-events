class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.date :date, null: false
      t.string :location, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
