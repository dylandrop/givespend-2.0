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

ActiveRecord::Schema.define(:version => 20130511181104) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "authentications", ["user_id"], :name => "index_authentications_on_user_id"

  create_table "cart_items", :force => true do |t|
    t.integer  "cart_id"
    t.integer  "item_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cart_items", ["cart_id"], :name => "index_cart_items_on_cart_id"
  add_index "cart_items", ["item_id"], :name => "index_cart_items_on_item_id"

  create_table "carts", :force => true do |t|
    t.integer  "user_id"
    t.date     "purchased_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "carts", ["user_id"], :name => "index_carts_on_user_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.integer  "charity_id"
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

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",  :null => false
    t.string   "encrypted_password",     :default => "",  :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street_address"
    t.integer  "zipcode"
    t.string   "state"
    t.string   "city"
    t.string   "admin",                  :default => "f"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
