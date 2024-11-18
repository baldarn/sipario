# frozen_string_literal: true

class CreateJwtDenylist < ActiveRecord::Migration[7.0]
  def change
    # rubocop:disable Rails/CreateTableWithTimestamps
    create_table :jwt_denylist do |t|
      t.string :jti, null: false
      t.datetime :exp, null: false
    end
    # rubocop:enable Rails/CreateTableWithTimestamps
    add_index :jwt_denylist, :jti
  end
end
