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

ActiveRecord::Schema.define(version: 20170601085605) do

  create_table "Campaigns_Cuepoints", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "cuepoint_id", null: false
    t.integer  "campaign_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
    t.index ["campaign_id"], name: "index_campaigns_cuepoints_on_campaign_id", using: :btree
    t.index ["cuepoint_id"], name: "index_campaigns_cuepoints_on_quepoint_id", using: :btree
  end

  create_table "campaigns", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",        null: false
    t.datetime "start_at",    null: false
    t.datetime "end_at",      null: false
    t.integer  "limit_start", null: false
    t.string   "movie_url",   null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
  end

  create_table "cuepoints", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "results", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "campaign_id"
    t.integer  "cuepoint_id"
    t.string   "deleted_at"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "count_start"
    t.integer  "count_complete"
    t.index ["campaign_id"], name: "index_results_on_campaign_id", using: :btree
    t.index ["cuepoint_id"], name: "index_results_on_cuepoint_id", using: :btree
  end

  add_foreign_key "Campaigns_Cuepoints", "campaigns"
  add_foreign_key "Campaigns_Cuepoints", "cuepoints"
end
