# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_29_214321) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "candidates", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "surname"
    t.string "firstname"
    t.string "about_me"
    t.integer "cpf"
    t.string "address"
    t.string "document"
    t.index ["document"], name: "index_candidates_on_document", unique: true
    t.index ["email"], name: "index_candidates_on_email", unique: true
    t.index ["reset_password_token"], name: "index_candidates_on_reset_password_token", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "domain"
    t.string "name"
    t.string "address"
    t.integer "cnpj"
    t.string "document"
    t.index ["cnpj"], name: "index_companies_on_cnpj", unique: true
    t.index ["document"], name: "index_companies_on_document", unique: true
    t.index ["domain"], name: "index_companies_on_domain", unique: true
  end

  create_table "employees", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstname"
    t.string "surname"
    t.integer "company_id"
    t.integer "role", default: 0
    t.index ["company_id"], name: "index_employees_on_company_id"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "job_applications", force: :cascade do |t|
    t.integer "job_opportunity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "candidate_id"
    t.integer "status"
    t.string "rejection_motive"
    t.index ["candidate_id"], name: "index_job_applications_on_candidate_id"
    t.index ["job_opportunity_id"], name: "index_job_applications_on_job_opportunity_id"
  end

  create_table "job_opportunities", force: :cascade do |t|
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "job_title"
    t.string "job_level"
    t.string "description"
    t.string "salary_range"
    t.string "place"
    t.date "limit_date"
    t.integer "status", default: 0
    t.integer "number_of_positions"
    t.index ["company_id"], name: "index_job_opportunities_on_company_id"
  end

  create_table "job_proposals", force: :cascade do |t|
    t.string "message"
    t.date "start_date"
    t.integer "salary_proposal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "candidate_id"
    t.integer "job_application_id"
    t.integer "status", default: 0
    t.string "rejection_motive"
    t.string "start_date_confirmation"
    t.index ["candidate_id"], name: "index_job_proposals_on_candidate_id"
    t.index ["job_application_id"], name: "index_job_proposals_on_job_application_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.integer "candidate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "education"
    t.string "experience"
    t.string "languages"
    t.string "abilities"
    t.string "courses"
    t.index ["candidate_id"], name: "index_resumes_on_candidate_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
