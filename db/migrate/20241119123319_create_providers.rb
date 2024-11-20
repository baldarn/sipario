class CreateProviders < ActiveRecord::Migration[8.0]
  def change
    create_table :providers do |t|
      t.string :name, null: false
      t.st_point :lonlat, geographic: true

      t.integer :minutes_for_points, null: false

      t.index :lonlat, using: :gist

      t.timestamps
    end
  end
end
