class CreateCertifiedPresences < ActiveRecord::Migration[8.0]
  def change
    create_table :certified_presences do |t|
      t.belongs_to :owner

      t.string :device_identifier

      t.timestamps

      t.index :device_identifier

      t.index :updated_at
      t.index :created_at
    end
  end
end
