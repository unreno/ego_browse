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

ActiveRecord::Schema.define(version: 20171002231655) do

  create_table "alterList", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "studyId", null: false
    t.text "name", null: false
    t.text "email", null: false
    t.integer "ordering", null: false
    t.integer "interviewerId", null: false
  end

  create_table "alterPrompt", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "studyId", null: false
    t.integer "afterAltersEntered", null: false
    t.text "display", null: false
  end

  create_table "alter_referral_sheets", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "data_entry_name"
    t.string "ego_id"
    t.integer "alter_referrals_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "alter_referrals", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "alter_referral_sheet_id"
    t.integer "plan_to_refer"
    t.string "name_cell"
    t.string "date_of_alter_interview"
    t.string "alter_id"
    t.string "date_ego_notified"
    t.string "date_ego_paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alter_referral_sheet_id"], name: "index_alter_referrals_on_alter_referral_sheet_id"
  end

  create_table "alters", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "active"
    t.integer "ordering", null: false
    t.text "name", null: false
    t.text "interviewId", null: false
    t.integer "alterListId"
  end

  create_table "answer", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "active"
    t.integer "questionId"
    t.integer "interviewId"
    t.integer "alterId1"
    t.integer "alterId2"
    t.text "value"
    t.text "otherSpecifyText"
    t.text "skipReason"
    t.integer "studyId"
    t.text "questionType"
    t.text "answerType"
    t.index ["questionId", "interviewId", "alterId1", "alterId2"], name: "answerIndex"
  end

  create_table "answerList", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "active"
    t.text "listName"
    t.integer "studyId"
    t.text "listOptionNames"
  end

  create_table "contact_informations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "data_entry_name"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "alternate_names"
    t.string "dob"
    t.string "primary_phone_number"
    t.string "primary_phone_type", limit: 5
    t.string "primary_phone_message", limit: 1
    t.string "primary_phone_text", limit: 1
    t.string "secondary_phone_number"
    t.string "secondary_phone_type", limit: 5
    t.string "secondary_phone_message", limit: 1
    t.string "secondary_phone_text", limit: 1
    t.string "tertiary_phone_number"
    t.string "tertiary_phone_type", limit: 5
    t.string "tertiary_phone_message", limit: 1
    t.string "tertiary_phone_text", limit: 1
    t.string "primary_address"
    t.string "primary_city"
    t.string "primary_state", limit: 5
    t.string "primary_zip", limit: 10
    t.string "secondary_address"
    t.string "secondary_city"
    t.string "secondary_state", limit: 5
    t.string "secondary_zip", limit: 10
    t.string "hopes_data", limit: 1
    t.string "future_data", limit: 1
    t.string "ok_to_mail_negative_test_result", limit: 1
    t.string "email"
    t.string "other_person_relationship"
    t.string "other_person_phone"
    t.string "other_person_ok_to_pass_message", limit: 1
    t.string "referral_source"
    t.string "height"
    t.string "build"
    t.integer "age"
    t.string "race"
    t.string "eye_color"
    t.string "hair"
    t.string "other_identifying_marks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eligibility_screenings", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "data_entry_name"
    t.string "how_learned", limit: 20
    t.string "how_learned_other"
    t.integer "age"
    t.integer "gender"
    t.integer "gender_at_birth"
    t.integer "race"
    t.string "race_other"
    t.integer "children"
    t.integer "seen_pcp"
    t.string "marital", limit: 10
    t.integer "tested_hiv"
    t.integer "tested_hiv_result"
    t.integer "partner_count"
    t.integer "injection_drugs"
    t.integer "partner_injection_drugs"
    t.integer "partner_noninjection_drugs"
    t.integer "partner_hiv_positive"
    t.integer "partner_other_partners"
    t.integer "partner_traded_sex"
    t.integer "partner_man_men"
    t.integer "eligible_q_9_16"
    t.integer "where_live"
    t.string "where_live_other"
    t.integer "willing_to_refer"
    t.integer "matched_to_ego"
    t.integer "eligible"
    t.string "name_of_screener"
    t.string "location_of_screening"
    t.string "date_of_screening"
    t.string "time_of_screening"
    t.integer "referred_for_interview"
    t.string "referred_appointment_date"
    t.string "referred_appointment_time"
    t.integer "reason_for_refusal"
    t.string "reason_for_refusal_other"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "age_other"
  end

  create_table "expression", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "active", default: 1
    t.text "name"
    t.text "type"
    t.text "operator"
    t.text "value"
    t.boolean "resultForUnanswered"
    t.integer "studyId"
    t.integer "questionId"
  end

  create_table "graphs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "interviewId", null: false
    t.integer "expressionId", null: false
    t.text "nodes", null: false, collation: "utf8mb4_general_ci"
    t.text "params", null: false, collation: "utf8mb4_general_ci"
  end

  create_table "interview", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "active", default: true
    t.integer "studyId"
    t.integer "completed"
    t.integer "start_date"
    t.integer "complete_date"
  end

  create_table "interview_notes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "data_entry_name"
    t.string "participant_id"
    t.string "interview_date"
    t.string "interviewer"
    t.text "interview_notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ars_number", limit: 10
  end

  create_table "interviewers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "studyId", null: false
    t.integer "interviewerId", null: false
  end

  create_table "legend", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "studyId", null: false
    t.integer "questionId", null: false
    t.string "shape", null: false
    t.string "label"
    t.string "color"
    t.integer "size"
    t.integer "ordering"
  end

  create_table "matchedAlters", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "studyId"
    t.integer "alterId1"
    t.integer "alterId2"
    t.string "matchedName", null: false
    t.integer "interviewId1"
    t.integer "interviewId2"
    t.integer "userId"
  end

  create_table "notes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "interviewId", null: false
    t.integer "expressionId", null: false
    t.string "alterId", limit: 64
    t.text "notes", null: false, collation: "utf32_general_ci"
  end

  create_table "otherSpecify", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "optionId"
    t.integer "interviewId"
    t.string "value", null: false
    t.integer "alterId"
  end

  create_table "question", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "active", default: 1
    t.text "title"
    t.text "prompt", limit: 4294967295
    t.text "preface", limit: 4294967295
    t.text "citation", limit: 4294967295
    t.text "subjectType"
    t.text "answerType"
    t.boolean "askingStyleList"
    t.integer "ordering"
    t.boolean "otherSpecify"
    t.text "noneButton"
    t.text "allButton"
    t.text "pageLevelDontKnowButton"
    t.text "pageLevelRefuseButton"
    t.boolean "dontKnowButton"
    t.boolean "refuseButton"
    t.text "allOptionString"
    t.text "uselfExpression"
    t.text "minLimitType"
    t.integer "minLiteral"
    t.text "minPrevQues"
    t.text "maxLimitType"
    t.integer "maxLiteral"
    t.text "maxPrevQues"
    t.integer "minCheckableBoxes"
    t.integer "maxCheckableBoxes"
    t.integer "withListRange"
    t.text "listRangeString"
    t.integer "minListRange"
    t.integer "maxListRange"
    t.integer "timeUnits"
    t.integer "symmetric"
    t.integer "keepOnSamePage"
    t.integer "studyId"
    t.integer "answerReasonExpressionId"
    t.integer "networkRelationshipExprId"
    t.text "networkParams"
    t.integer "networkNColorQId"
    t.integer "networkNSizeQId"
    t.integer "networkEColorQId"
    t.integer "networkESizeQId"
    t.text "useAlterListField"
    t.text "javascript", limit: 4294967295
  end

  create_table "questionOption", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "active", default: 1
    t.integer "studyId"
    t.integer "questionId"
    t.text "name"
    t.text "value"
    t.integer "ordering"
    t.boolean "otherSpecify"
  end

  create_table "rails_roles", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rails_roles_users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "rails_user_id", null: false
    t.integer "rails_role_id", null: false
    t.index ["rails_role_id", "rails_user_id"], name: "index_rails_roles_users_on_rails_role_id_and_rails_user_id", unique: true
  end

  create_table "rails_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "login"
    t.string "crypted_password"
    t.string "password_salt"
    t.string "persistence_token"
    t.string "single_access_token"
    t.string "perishable_token"
    t.integer "login_count", default: 0, null: false
    t.integer "failed_login_count", default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string "current_login_ip"
    t.string "last_login_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "session", id: :string, limit: 32, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "expire"
    t.binary "data", limit: 4294967295
  end

  create_table "sti_questionnaires", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "data_entry_name"
    t.string "date_of_visit"
    t.string "participant_id"
    t.string "staff_person"
    t.integer "stitest_ev"
    t.integer "stitest_a"
    t.integer "stitest_b"
    t.integer "stitest_c"
    t.integer "stitest_d"
    t.integer "stitest_e"
    t.integer "stitest_f"
    t.integer "stitest_g"
    t.integer "stitest_h"
    t.integer "stitest_i"
    t.integer "stitest_j"
    t.string "stitest_other"
    t.string "stitest_last"
    t.integer "stitest_last_never"
    t.integer "stitest_reason_a"
    t.integer "stitest_reason_b"
    t.integer "stitest_reason_c"
    t.integer "stitest_reason_d"
    t.integer "stitest_reason_e"
    t.integer "stitest_reason_f"
    t.integer "stitest_reason_g"
    t.integer "stitest_reason_h"
    t.integer "stitest_reason_i"
    t.string "stitest_reason_other"
    t.integer "stitest_locn"
    t.string "stitest_locn_other"
    t.integer "stitest_rslt"
    t.integer "notest_reason_a"
    t.integer "notest_reason_b"
    t.integer "notest_reason_c"
    t.integer "notest_reason_d"
    t.integer "notest_reason_e"
    t.integer "notest_reason_f"
    t.integer "notest_reason_g"
    t.integer "notest_reason_h"
    t.integer "notest_reason_i"
    t.string "notest_reason_other"
    t.integer "stitest_future"
    t.integer "stipercrisk"
    t.integer "stistigma"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "female_given"
  end

  create_table "study", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "active", default: 1, null: false
    t.text "name", null: false
    t.text "introduction", limit: 4294967295
    t.text "egoIdPrompt", limit: 4294967295
    t.text "alterPrompt", limit: 4294967295
    t.text "conclusion", limit: 4294967295
    t.integer "minAlters", default: 0, null: false
    t.integer "maxAlters", default: 20, null: false
    t.integer "valueRefusal", default: -1
    t.integer "valueDontKnow", default: -2
    t.integer "valueLogicalSkip", default: -3
    t.integer "valueNotYetAnswered", default: -4, null: false
    t.datetime "modified"
    t.integer "multiSessionEgoId", default: 0, null: false
    t.boolean "useAsAlters", default: false, null: false
    t.boolean "restrictAlters", default: false, null: false
    t.boolean "fillAlterList", default: false, null: false
    t.integer "created_date"
    t.integer "closed_date"
    t.integer "status"
    t.integer "userId", null: false
    t.boolean "hideEgoIdPage", null: false
    t.text "style"
    t.text "javascript", limit: 4294967295
    t.text "footer", limit: 4294967295
    t.text "header", limit: 4294967295
  end

  create_table "tbl_migration", primary_key: "version", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "apply_time"
  end

  create_table "testing_facilitations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "data_entry_name"
    t.string "date_of_visit"
    t.string "participant_id"
    t.string "staff_person"
    t.integer "agree_to_use_home_test_kit_at_site"
    t.string "agree_to_use_home_test_kit_at_site_refusal_reason"
    t.integer "agree_to_take_test_kit_home"
    t.string "agree_to_take_test_kit_home_refusal_reason"
    t.integer "agree_to_tell_result_of_home_test_kit"
    t.string "agree_to_tell_result_of_home_test_kit_refusal_reason"
    t.integer "result_of_home_test_kit"
    t.integer "confirmatory_test_referred_location"
    t.string "confirmatory_test_referred_appointment"
    t.string "confirmatory_test_referred_location_other"
    t.integer "indeterminate_test_option"
    t.string "indeterminate_test_result"
    t.string "indeterminate_test_referred_to"
    t.integer "urine_to_test"
    t.integer "urine_to_test_refusal_reason"
    t.string "urine_to_test_refusal_reason_other"
    t.integer "gonorrhea_result"
    t.integer "chlamydia_result"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "email", null: false
    t.text "password", null: false
    t.text "name", null: false
    t.datetime "lastActivity", null: false
    t.integer "permissions", default: 1, null: false
  end

end
