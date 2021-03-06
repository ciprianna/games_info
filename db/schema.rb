# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_14_010202) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consoles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_consoles_on_name"
  end

  create_table "game_consoles", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "console_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["console_id"], name: "index_game_consoles_on_console_id"
    t.index ["game_id"], name: "index_game_consoles_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.integer "release_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.text "description"
    t.index ["release_year"], name: "index_games_on_release_year"
    t.index ["title"], name: "index_games_on_title"
  end

  add_foreign_key "game_consoles", "consoles"
  add_foreign_key "game_consoles", "games"
end
