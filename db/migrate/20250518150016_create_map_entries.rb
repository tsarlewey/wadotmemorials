class CreateMapEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :map_entries do |t|
      t.string :title
      t.text :description
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6

      t.timestamps
    end
  end
end
