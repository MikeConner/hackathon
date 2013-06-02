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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130602002253) do

  create_table "burdens", :force => true do |t|
    t.integer  "property_id"
    t.string   "user_identifier"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "likes", :force => true do |t|
    t.integer  "suggestion_id"
    t.string   "user_identifier"
    t.text     "comment"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "properties", :force => true do |t|
    t.string   "parcel_id",      :limit => 20
    t.string   "address",        :limit => 128
    t.integer  "land_value"
    t.integer  "building_value"
    t.integer  "taxes"
    t.string   "owner",          :limit => 64
    t.boolean  "vacant"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "tax_category"
    t.integer  "lot_area"
  end

  create_table "suggestions", :force => true do |t|
    t.integer  "property_id"
    t.string   "category"
    t.string   "description"
    t.string   "user_identifier"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
