class CreatePointEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :point_events do |t|
      t.belongs_to :provider
      t.belongs_to :user

      t.belongs_to :sipario_session
      t.belongs_to :award

      t.integer :points, null: false

      t.timestamps
    end
  end
end
