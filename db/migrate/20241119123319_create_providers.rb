class CreateProviders < ActiveRecord::Migration[8.0]
  def change
    create_table :providers do |t|
      t.string :name
      t.st_point :lonlat, geographic: true

      t.index :lonlat, using: :gist

      t.timestamps
    end
  end
end
