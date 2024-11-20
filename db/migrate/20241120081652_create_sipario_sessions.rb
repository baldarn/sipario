class CreateSiparioSessions < ActiveRecord::Migration[8.0]
  def change
    create_table :sipario_sessions do |t|
      t.belongs_to :user

      t.string :device_identifier

      t.text :nearby_identifiers

      t.timestamps
    end
  end
end
