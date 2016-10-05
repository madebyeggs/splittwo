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

ActiveRecord::Schema.define(version: 20161005190512) do

  create_table "announcements", force: :cascade do |t|
    t.text     "slide_title"
    t.string   "vimeo"
    t.text     "description"
    t.string   "soundcloud"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "slide_image_file_name"
    t.string   "slide_image_content_type"
    t.integer  "slide_image_file_size"
    t.datetime "slide_image_updated_at"
    t.string   "slug"
    t.integer  "row_order"
    t.string   "fb_image_file_name"
    t.string   "fb_image_content_type"
    t.integer  "fb_image_file_size"
    t.datetime "fb_image_updated_at"
    t.boolean  "slideshow"
    t.text     "slide_title2"
    t.text     "slide_title3"
    t.integer  "Slideshowposition"
  end

  add_index "announcements", ["slug"], name: "index_announcements_on_slug", unique: true

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "soundcloud"
    t.string   "fb_url"
    t.string   "twitter_name"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "fb_image_file_name"
    t.string   "fb_image_content_type"
    t.integer  "fb_image_file_size"
    t.datetime "fb_image_updated_at"
    t.integer  "row_order"
    t.string   "slug"
    t.boolean  "slideshow"
    t.string   "slide_image_file_name"
    t.string   "slide_image_content_type"
    t.integer  "slide_image_file_size"
    t.datetime "slide_image_updated_at"
    t.text     "slide_title"
    t.string   "vimeo"
    t.text     "slide_title2"
    t.text     "slide_title3"
    t.integer  "Slideshowposition"
  end

  add_index "artists", ["slug"], name: "index_artists_on_slug", unique: true

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "releases", force: :cascade do |t|
    t.string   "title"
    t.string   "soundcloud"
    t.text     "description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "fb_image_file_name"
    t.string   "fb_image_content_type"
    t.integer  "fb_image_file_size"
    t.datetime "fb_image_updated_at"
    t.integer  "row_order"
    t.string   "slug"
    t.boolean  "slideshow"
    t.string   "slide_image_file_name"
    t.string   "slide_image_content_type"
    t.integer  "slide_image_file_size"
    t.datetime "slide_image_updated_at"
    t.text     "slide_title"
    t.string   "vimeo"
    t.text     "slide_title2"
    t.text     "slide_title3"
    t.integer  "Slideshowposition"
  end

  add_index "releases", ["slug"], name: "index_releases_on_slug", unique: true

  create_table "slides", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "works", force: :cascade do |t|
    t.string   "brand_name"
    t.string   "campaign_title"
    t.string   "agency"
    t.string   "track_name"
    t.string   "artist_name"
    t.text     "description"
    t.string   "vimeo"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "fb_image_file_name"
    t.string   "fb_image_content_type"
    t.integer  "fb_image_file_size"
    t.datetime "fb_image_updated_at"
    t.integer  "row_order"
    t.string   "slug"
    t.text     "slide_title"
    t.string   "slide_image_file_name"
    t.string   "slide_image_content_type"
    t.integer  "slide_image_file_size"
    t.datetime "slide_image_updated_at"
    t.boolean  "slideshow"
    t.string   "soundcloud"
    t.text     "slide_title2"
    t.text     "slide_title3"
    t.integer  "Slideshowposition"
  end

  add_index "works", ["slug"], name: "index_works_on_slug", unique: true

end
