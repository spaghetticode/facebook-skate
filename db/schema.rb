# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090914214854) do

  create_table "actions", :force => true do |t|
    t.string   "name"
    t.text     "message"
    t.string   "image"
    t.text     "executable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "caption"
    t.text     "message"
    t.string   "image"
    t.text     "executable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "price"
    t.integer  "rank_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",    :default => 0
    t.string   "attribute"
  end

  create_table "items_users", :id => false, :force => true do |t|
    t.integer "item_id"
    t.integer "user_id"
  end

  create_table "matches", :force => true do |t|
    t.integer  "user_id"
    t.integer  "contender_id"
    t.boolean  "victory",      :default => false
    t.boolean  "closed",       :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.text     "body"
    t.string   "image"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ranks", :force => true do |t|
    t.string   "name"
    t.integer  "level"
    t.integer  "next_rank_id"
    t.integer  "min_experience"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tricks", :force => true do |t|
    t.string   "name"
    t.integer  "rank_id"
    t.integer  "difficulty"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.integer  "facebook_id", :limit => 20,                 :null => false
    t.string   "session_key"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rank_id"
    t.integer  "experience",                :default => 0
    t.integer  "money",                     :default => 0
    t.integer  "stamina",                   :default => 0
    t.integer  "dexterity",                 :default => 0
    t.string   "trainings",                 :default => ""
  end

end
