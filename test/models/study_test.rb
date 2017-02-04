require 'test_helper'

class StudyTest < ActiveSupport::TestCase

	test "responds to alter_lists" do
		assert_empty self.class.name.gsub(/Test$/,'').constantize.new.alter_lists
	end

	test "responds to alter_prompts" do
		assert_empty self.class.name.gsub(/Test$/,'').constantize.new.alter_prompts
	end

	test "responds to answer_lists" do
		assert_empty self.class.name.gsub(/Test$/,'').constantize.new.answer_lists
	end

	test "responds to answers" do
		assert_empty self.class.name.gsub(/Test$/,'').constantize.new.answers
	end

	test "responds to expressions" do
		assert_empty self.class.name.gsub(/Test$/,'').constantize.new.expressions
	end

	test "responds to interviewers" do
		assert_empty self.class.name.gsub(/Test$/,'').constantize.new.interviewers
	end

	test "responds to interviews" do
		assert_empty self.class.name.gsub(/Test$/,'').constantize.new.interviews
	end

	test "responds to legends" do
		assert_empty self.class.name.gsub(/Test$/,'').constantize.new.legends
	end

	test "responds to matched_alters" do
		assert_empty self.class.name.gsub(/Test$/,'').constantize.new.matched_alters
	end

	test "responds to question_options" do
		assert_empty self.class.name.gsub(/Test$/,'').constantize.new.question_options
	end

	test "responds to questions" do
		assert_empty self.class.name.gsub(/Test$/,'').constantize.new.questions
	end

#	This may be untestable as these tables exist outside the app
#    t.integer  "active",                                 default: 1,     null: false
#    t.text     "name",                limit: 65535,                      null: false
#    t.integer  "minAlters",                              default: 0,     null: false
#    t.integer  "maxAlters",                              default: 20,    null: false
#    t.integer  "valueNotYetAnswered",                    default: -4,    null: false
#    t.integer  "multiSessionEgoId",                      default: 0,     null: false
#    t.boolean  "useAsAlters",                            default: false, null: false
#    t.boolean  "restrictAlters",                         default: false, null: false
#    t.boolean  "fillAlterList",                          default: false, null: false
#    t.integer  "userId",                                                 null: false
#    t.boolean  "hideEgoIdPage",                                          null: false
#	Actually, the schema is extracted so is available for testing.

	test "race_qid should return the id of the question titled RACE" do
		s = Study.create!(name:'Study Name',userId:0,hideEgoIdPage:true)
		question = s.questions.create!(title: 'RACE')
		assert_equal s.race_qid, question.id
	end

	test "hisplat_qid should return the id of the question titled HISPLAT" do
		s = Study.create!(name:'Study Name',userId:0,hideEgoIdPage:true)
		question = s.questions.create!(title: 'HISPLAT')
		assert_equal s.hisplat_qid, question.id
	end

	test "gender_qid should return the id of the question titled GENDER" do
		s = Study.create!(name:'Study Name',userId:0,hideEgoIdPage:true)
		question = s.questions.create!(title: 'GENDER')
		assert_equal s.gender_qid, question.id
	end

	test "sex_qid should return the id of the question titled SEX" do
		s = Study.create!(name:'Study Name',userId:0,hideEgoIdPage:true)
		question = s.questions.create!(title: 'SEX')
		assert_equal s.sex_qid, question.id
	end

	test "subject_qid should return the id of the question titled SUBJECT" do
		s = Study.create!(name:'Study Name',userId:0,hideEgoIdPage:true)
		question = s.questions.create!(title: 'SUBJECT')
		assert_equal s.subject_qid, question.id
	end

	test "races should return text list of valid race answers" do
		#	well, sort of
		s = Study.create!(name:'Study Name',userId:0,hideEgoIdPage:true)
		question = s.questions.create!(title: 'RACE')
		question.question_options.create!(name:'race1/spanish race1')
		question.question_options.create!(name:'race2/spanish race2')
		assert_equal s.races, ['race1','race2','More Than One','Unknown']
	end

	test "hisplats should return text list of valid hisplat answers" do
		#	well, sort of
		s = Study.create!(name:'Study Name',userId:0,hideEgoIdPage:true)
		question = s.questions.create!(title: 'HISPLAT')
		question.question_options.create!(name:'Yes/spanish Yes')
		question.question_options.create!(name:'No/spanish No')
		assert_equal s.hisplats, ['Yes','No','Unknown']
	end

	test "sexes should return text list of valid sex answers" do
		#	well, sort of
		s = Study.create!(name:'Study Name',userId:0,hideEgoIdPage:true)
		question = s.questions.create!(title: 'SEX')
		question.question_options.create!(name:'sex1/spanish sex1')
		question.question_options.create!(name:'sex2/spanish sex2')
		assert_equal s.sexes, ['sex1','sex2','Unknown']
	end

	test "genders should return text list of valid gender answers" do
		#	well, sort of
		s = Study.create!(name:'Study Name',userId:0,hideEgoIdPage:true)
		question = s.questions.create!(title: 'GENDER')
		question.question_options.create!(name:'gender1/spanish gender1')
		question.question_options.create!(name:'gender2/spanish gender2')
		assert_equal s.genders, ['gender1','gender2','Unknown']
	end

end
