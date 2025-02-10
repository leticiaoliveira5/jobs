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

ActiveRecord::Schema[7.1].define(version: 2025_02_10_162205) do
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

  create_table "addresses", force: :cascade do |t|
    t.bigint "resource_id", null: false
    t.string "resource_type", null: false
    t.string "street"
    t.string "number"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candidate_skills", force: :cascade do |t|
    t.bigint "candidate_id"
    t.bigint "skill_id"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id", "candidate_id"], name: "index_candidate_skills_on_skill_id_and_candidate_id", unique: true
  end

  create_table "candidates", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.string "website"
    t.string "about_me"
    t.string "firstname"
    t.string "surname"
    t.string "document"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["document"], name: "index_candidates_on_document", unique: true
    t.index ["email"], name: "index_candidates_on_email", unique: true
    t.index ["reset_password_token"], name: "index_candidates_on_reset_password_token", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "domain"
    t.string "name"
    t.string "document"
    t.index ["document"], name: "index_companies_on_document", unique: true
    t.index ["domain"], name: "index_companies_on_domain", unique: true
  end

  create_table "courses", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.string "title", null: false
    t.text "skills", default: [], array: true
    t.string "certificate_link"
    t.string "description", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "degrees", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.string "title", null: false
    t.integer "graduation_year", null: false
    t.string "institution"
    t.integer "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "firstname"
    t.string "surname"
    t.bigint "company_id"
    t.integer "role", default: 0
    t.index ["company_id"], name: "index_employees_on_company_id"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "job_applications", force: :cascade do |t|
    t.bigint "job_opportunity_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "candidate_id"
    t.integer "status"
    t.string "rejection_motive"
    t.index ["candidate_id"], name: "index_job_applications_on_candidate_id"
    t.index ["job_opportunity_id"], name: "index_job_applications_on_job_opportunity_id"
  end

  create_table "job_opportunities", force: :cascade do |t|
    t.bigint "company_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "job_title"
    t.string "job_level"
    t.string "description"
    t.string "salary_range"
    t.string "place"
    t.datetime "limit_date", precision: nil
    t.integer "status", default: 0
    t.integer "number_of_positions"
    t.index ["company_id"], name: "index_job_opportunities_on_company_id"
  end

  create_table "job_proposals", force: :cascade do |t|
    t.string "message"
    t.date "start_date"
    t.integer "salary_proposal"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "candidate_id"
    t.bigint "job_application_id"
    t.integer "status", default: 0
    t.string "rejection_motive"
    t.string "start_date_confirmation"
    t.bigint "job_opportunity_id"
    t.index ["candidate_id"], name: "index_job_proposals_on_candidate_id"
    t.index ["job_application_id"], name: "index_job_proposals_on_job_application_id"
    t.index ["job_opportunity_id"], name: "index_job_proposals_on_job_opportunity_id"
  end

  create_table "languages", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.integer "proficiency", null: false
    t.string "name", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_skills_on_name", unique: true
  end

  create_table "work_experiences", force: :cascade do |t|
    t.bigint "candidate_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "company_name"
    t.string "description"
    t.string "job_title"
    t.integer "sector"
    t.string "location"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "employees", "companies"
  add_foreign_key "job_applications", "candidates"
  add_foreign_key "job_applications", "job_opportunities"
  add_foreign_key "job_opportunities", "companies"
  add_foreign_key "job_proposals", "candidates"
  add_foreign_key "job_proposals", "job_applications"
  add_foreign_key "job_proposals", "job_opportunities"
end
