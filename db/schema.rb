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

ActiveRecord::Schema.define(version: 20170525113444) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "billings", force: :cascade do |t|
    t.bigint "subscription_id"
    t.string "state", limit: 45
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "EUR", null: false
    t.datetime "begin_at"
    t.datetime "end_at"
    t.string "gateway_payment_profile_id", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscription_id"], name: "index_billings_on_subscription_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.bigint "theme_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["theme_id"], name: "index_categories_on_theme_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.integer "notation"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "credit_cards", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "month"
    t.integer "year"
    t.integer "day"
    t.integer "last_digits"
    t.string "cc_type", limit: 45
    t.string "gateway_customer_profile_id", limit: 45
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_credit_cards_on_user_id"
  end

  create_table "report_sources", force: :cascade do |t|
    t.bigint "report_id"
    t.string "url", null: false
    t.string "title", limit: 255
    t.text "excerpt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_report_sources_on_report_id"
  end

  create_table "reports", force: :cascade do |t|
    t.bigint "tower_guard_id"
    t.bigint "tower_id"
    t.string "title", null: false
    t.text "excerpt"
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tower_guard_id"], name: "index_reports_on_tower_guard_id"
    t.index ["tower_id"], name: "index_reports_on_tower_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "tower_id"
    t.string "state", limit: 45
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "EUR", null: false
    t.string "recurrence"
    t.datetime "canceled_at"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "owner_id"
    t.index ["owner_id"], name: "index_subscriptions_on_owner_id"
    t.index ["tower_id"], name: "index_subscriptions_on_tower_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
  end

  create_table "tower_guards", force: :cascade do |t|
    t.bigint "tower_id"
    t.string "roles", array: true
    t.text "description"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "guard_id"
    t.index ["guard_id"], name: "index_tower_guards_on_guard_id"
    t.index ["tower_id"], name: "index_tower_guards_on_tower_id"
  end

  create_table "towers", force: :cascade do |t|
    t.string "title", limit: 255, null: false
    t.text "description", null: false
    t.string "locales", array: true
    t.integer "price_per_month_cents", default: 0, null: false
    t.string "price_per_month_currency", default: "EUR", null: false
    t.string "frequency", limit: 45, null: false
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["category_id"], name: "index_towers_on_category_id"
  end

  create_table "user_subscriptions", force: :cascade do |t|
    t.bigint "subscription_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscription_id"], name: "index_user_subscriptions_on_subscription_id"
    t.index ["user_id"], name: "index_user_subscriptions_on_user_id"
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "billings", "subscriptions"
  add_foreign_key "categories", "themes"
  add_foreign_key "comments", "users"
  add_foreign_key "credit_cards", "users"
  add_foreign_key "report_sources", "reports"
  add_foreign_key "reports", "tower_guards"
  add_foreign_key "reports", "towers"
  add_foreign_key "subscriptions", "towers"
  add_foreign_key "subscriptions", "users", column: "owner_id"
  add_foreign_key "tower_guards", "towers"
  add_foreign_key "tower_guards", "users", column: "guard_id"
  add_foreign_key "towers", "categories"
  add_foreign_key "user_subscriptions", "subscriptions"
  add_foreign_key "user_subscriptions", "users"
end
