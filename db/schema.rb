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

ActiveRecord::Schema.define(version: 20171109152026) do

  create_table "agendas", force: :cascade do |t|
    t.string   "nombre"
    t.string   "empresa"
    t.string   "cargo"
    t.string   "telefono"
    t.string   "celular"
    t.string   "email"
    t.string   "direccion_empresa"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "mobil"
    t.string   "cargo"
    t.string   "user_id"
    t.string   "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.string   "address"
    t.string   "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "filament_counts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "merges", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.date     "fecha_pedido"
    t.integer  "customer_id"
    t.integer  "user_id"
    t.text     "comentarios"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "pedidos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.date     "fecha_entrega"
    t.date     "fecha_ingreso_inv"
    t.date     "fecha_pedido"
    t.date     "fecha_entrega_real"
    t.string   "estado_entrega"
    t.boolean  "estado"
    t.integer  "contador"
    t.string   "codigo"
    t.integer  "contador_entrega"
    t.integer  "cantidad"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "customer_id"
    t.integer  "order_id"
    t.integer  "ano"
    t.integer  "mes"
    t.integer  "dia"
  end

  create_table "plants", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_dates", force: :cascade do |t|
    t.integer  "number"
    t.date     "date"
    t.integer  "report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_product_dates_on_report_id"
  end

  create_table "product_images", force: :cascade do |t|
    t.integer  "number"
    t.string   "image"
    t.text     "description"
    t.integer  "report_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["report_id"], name: "index_product_images_on_report_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "nombre"
    t.string   "titulo"
    t.string   "tipo"
    t.string   "merge"
    t.string   "medida"
    t.string   "hilos"
    t.string   "carretes"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "count"
    t.string   "code"
    t.string   "autor"
    t.string   "product_name"
    t.date     "customer_report_date"
    t.date     "report_start_date"
    t.integer  "plant_id"
    t.string   "title"
    t.float    "value"
    t.float    "decitex"
    t.float    "denier"
    t.integer  "yarn_type_id"
    t.integer  "merge_id"
    t.integer  "filament_count_id"
    t.string   "segment"
    t.string   "customer_end_use"
    t.string   "invoice_invista"
    t.string   "invoice_mag"
    t.float    "quantity_shipped"
    t.float    "quantity_affected"
    t.float    "return_potential"
    t.float    "return_value"
    t.float    "claim_potential"
    t.float    "claim_value"
    t.integer  "customer_id"
    t.string   "reporter"
    t.string   "phone"
    t.string   "email"
    t.string   "source"
    t.integer  "specific_problem_id"
    t.text     "description_problem"
    t.text     "preliminary_investigation"
    t.text     "preliminary_conclusions"
    t.text     "research_results"
    t.text     "conclusions_plant"
    t.text     "action_plan"
    t.boolean  "close_claim"
    t.date     "date_close"
    t.text     "validation_claim"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["customer_id"], name: "index_reports_on_customer_id"
    t.index ["filament_count_id"], name: "index_reports_on_filament_count_id"
    t.index ["merge_id"], name: "index_reports_on_merge_id"
    t.index ["plant_id"], name: "index_reports_on_plant_id"
    t.index ["specific_problem_id"], name: "index_reports_on_specific_problem_id"
    t.index ["yarn_type_id"], name: "index_reports_on_yarn_type_id"
  end

  create_table "seguimientos", force: :cascade do |t|
    t.string   "attachment"
    t.text     "description"
    t.integer  "report_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["report_id"], name: "index_seguimientos_on_report_id"
  end

  create_table "specific_problems", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tracings", force: :cascade do |t|
    t.string   "attachment"
    t.text     "description"
    t.integer  "reports_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["reports_id"], name: "index_tracings_on_reports_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "nombre"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "yarn_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
