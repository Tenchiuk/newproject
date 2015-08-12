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

ActiveRecord::Schema.define(version: 20150719133907) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "contacts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", primary_key: "idcourses", force: :cascade do |t|
    t.string "Name",          limit: 45
    t.string "Qualification", limit: 45
  end

  create_table "grades", primary_key: "idgrades", force: :cascade do |t|
    t.string "Grade", limit: 45
  end

  create_table "student_courses", primary_key: "student_id", force: :cascade do |t|
    t.integer "course_id", limit: 4, null: false
  end

  add_index "student_courses", ["course_id"], name: "ref_course_id_idx", using: :btree

  create_table "student_grades", id: false, force: :cascade do |t|
    t.integer "student_id", limit: 4, null: false
    t.integer "grade_id",   limit: 4, null: false
  end

  add_index "student_grades", ["grade_id"], name: "ref_studentgrade_grade_id_idx", using: :btree
  add_index "student_grades", ["student_id"], name: "ref_studentgrade_student_id_idx", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "FirstName",  limit: 255
    t.string   "LastName",   limit: 255
    t.string   "Sex",        limit: 255
    t.string   "Address1",   limit: 255
    t.string   "Address2",   limit: 255
    t.string   "Town",       limit: 255
    t.string   "County",     limit: 255
    t.string   "PostCode",   limit: 255
    t.string   "MainNumber", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tutor_courses", id: false, force: :cascade do |t|
    t.integer "tutor_id",  limit: 4, null: false
    t.integer "course_id", limit: 4, null: false
  end

  add_index "tutor_courses", ["course_id"], name: "ref_tutorcourses_course_id_idx", using: :btree

  create_table "tutors", primary_key: "idtutors", force: :cascade do |t|
    t.string "FirstName",   limit: 45
    t.string "LastName",    limit: 45
    t.string "HouseNumber", limit: 45
    t.string "Address1",    limit: 45
    t.string "Address2",    limit: 45
    t.string "Town",        limit: 45
    t.string "County",      limit: 45
    t.string "MainNumber",  limit: 45
    t.string "Email",       limit: 45
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "student_courses", "courses", primary_key: "idcourses", name: "ref_course_id"
  add_foreign_key "student_courses", "students", name: "ref_student_id"
  add_foreign_key "student_grades", "grades", primary_key: "idgrades", name: "ref_studentgrade_grade_id"
  add_foreign_key "student_grades", "students", name: "ref_studentgrade_student_id"
  add_foreign_key "tutor_courses", "courses", primary_key: "idcourses", name: "ref_tutorcourses_course_id"
  add_foreign_key "tutor_courses", "tutors", primary_key: "idtutors", name: "ref_tutorcourses_tutor_id"
end
