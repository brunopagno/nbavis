# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140629184337) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "player_data", force: true do |t|
    t.integer  "player_id"
    t.integer  "team_id"
    t.integer  "year"
    t.integer  "games_played"
    t.integer  "minutes"
    t.integer  "points"
    t.integer  "offensive_rebounds"
    t.integer  "defensive_rebounds"
    t.integer  "rebounds"
    t.integer  "assists"
    t.integer  "steals"
    t.integer  "blocks"
    t.integer  "turnovers"
    t.integer  "personal_fouls"
    t.integer  "field_goals_attempted"
    t.integer  "field_goals_made"
    t.integer  "free_throws_attempted"
    t.integer  "free_throws_made"
    t.integer  "three_points_attempted"
    t.integer  "three_points_made"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "player_data", ["player_id"], name: "index_player_data_on_player_id", using: :btree
  add_index "player_data", ["team_id"], name: "index_player_data_on_team_id", using: :btree

  create_table "players", force: true do |t|
    t.string   "ilkid"
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["ilkid"], name: "index_players_on_ilkid", unique: true, using: :btree

  create_table "team_data", force: true do |t|
    t.integer  "team_id"
    t.integer  "year"
    t.integer  "field_goals_made"
    t.integer  "field_goals_attempted"
    t.integer  "free_throws_made"
    t.integer  "free_throws_attempted"
    t.integer  "offensive_resbounds"
    t.integer  "defensive_rebounds"
    t.integer  "rebounds"
    t.integer  "assists"
    t.integer  "personal_fouls"
    t.integer  "steals"
    t.integer  "turnovers"
    t.integer  "blocks"
    t.integer  "three_points_made"
    t.integer  "three_points_attempted"
    t.integer  "points"
    t.integer  "won"
    t.integer  "lost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "team_data", ["team_id"], name: "index_team_data_on_team_id", using: :btree

  create_table "teams", force: true do |t|
    t.string   "alias"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
