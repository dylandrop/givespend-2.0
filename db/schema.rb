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

ActiveRecord::Schema.define(:version => 20130510000338) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.integer  "charity_id"
    t.integer  "cart_id"
    t.integer  "category_id"
    t.integer  "price"
    t.text     "description"
    t.integer  "percentage"
    t.integer  "user_id"
    t.date     "purchased_at"
    t.date     "expires_from_cart_at"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "items", ["cart_id"], :name => "index_items_on_cart_id"
  add_index "items", ["category_id"], :name => "index_items_on_category_id"
  add_index "items", ["charity_id"], :name => "index_items_on_charity_id"
  add_index "items", ["user_id"], :name => "index_items_on_user_id"

  create_table "nonprofits", :force => true do |t|
    t.string   "name"
    t.string   "website"
    t.string   "email"
    t.text     "info"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
