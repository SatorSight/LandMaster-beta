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

ActiveRecord::Schema.define(version: 20171208132953) do

  create_table "pages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "title"
    t.float "start", limit: 24
    t.boolean "free"
    t.string "url"
    t.string "button_text"
    t.string "button_color"
    t.integer "store"
    t.string "img_left"
    t.string "img_right"
    t.string "img_bottom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ya_counter"
    t.string "ga_counter"
    t.string "link"
  end

end
