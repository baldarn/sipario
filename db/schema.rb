# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2024_11_20_100259) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "postgis"

  create_table "awards", force: :cascade do |t|
    t.bigint "provider_id"
    t.string "name", null: false
    t.string "description", null: false
    t.integer "points_to_redeem", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_awards_on_provider_id"
  end

  create_table "certified_presences", force: :cascade do |t|
    t.bigint "owner_id"
    t.string "device_identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_certified_presences_on_created_at"
    t.index ["device_identifier"], name: "index_certified_presences_on_device_identifier"
    t.index ["owner_id"], name: "index_certified_presences_on_owner_id"
    t.index ["updated_at"], name: "index_certified_presences_on_updated_at"
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "owners", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.bigint "provider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_owners_on_confirmation_token", unique: true
    t.index ["email"], name: "index_owners_on_email", unique: true
    t.index ["provider_id"], name: "index_owners_on_provider_id"
    t.index ["reset_password_token"], name: "index_owners_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_owners_on_unlock_token", unique: true
  end

  create_table "point_events", force: :cascade do |t|
    t.bigint "provider_id"
    t.bigint "user_id"
    t.bigint "sipario_session_id"
    t.bigint "award_id"
    t.uuid "consume_code"
    t.boolean "used", default: false, null: false
    t.integer "points", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["award_id"], name: "index_point_events_on_award_id"
    t.index ["consume_code"], name: "index_point_events_on_consume_code"
    t.index ["provider_id"], name: "index_point_events_on_provider_id"
    t.index ["sipario_session_id"], name: "index_point_events_on_sipario_session_id"
    t.index ["user_id"], name: "index_point_events_on_user_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "name", null: false
    t.geography "lonlat", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.integer "minutes_for_points", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lonlat"], name: "index_providers_on_lonlat", using: :gist
  end

  create_table "sipario_sessions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "provider_id"
    t.string "device_identifier", null: false
    t.text "nearby_identifiers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_sipario_sessions_on_provider_id"
    t.index ["user_id"], name: "index_sipario_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end
end
