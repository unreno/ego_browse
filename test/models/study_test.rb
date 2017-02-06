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

	#	This feature should be elsewhere
	test "decode value should return question option names corresponding to encrypted ids" do
		qo1 = QuestionOption.create(name: 'QO1')
		encrypted_value = MCRYPT.myencrypt("#{qo1.id}")
		assert_equal Study.new.decode(encrypted_value), ['QO1']
	end



	test "should build empty study" do
		assert_difference('Question.count',5) {
		assert_difference('Interview.count',0) {
		assert_difference('Study.count',1) {
			Study.create_empty
		} } }
	end

	test "should return blank study raw demographics" do
		d = Study.create_empty.raw_demographics
		assert_equal d.length, 0
	end

	test "should return blank study demographics" do
		d = Study.create_empty.demographics
		assert_equal d.length, 0
	end

	test "should return blank study demographics hash" do
		s = Study.create_empty
		d = s.demographics_hash
		assert_equal d[:id], s.id
		assert_equal d[:races], ["More Than One","Unknown"]
		assert_equal d[:hisplats], ["Unknown"]
		assert_equal d[:sexes], ["Unknown"]
		assert_equal d[:genders], ["Unknown"]
		dd=d[:demographics]
		assert_equal dd.length, 0
end

	test "should return blank study nested demographics" do
		s = Study.create_empty
		d = s.nested_demographics
		assert d.empty?
	end

	test "should return blank study nested raw demographics" do
		s = Study.create_empty
		d = s.nested_raw_demographics
		assert d.empty?
	end

	test "should return blank study ego alter demographics" do
		s = Study.create_empty
		d = s.ego_alter_demographics
		assert d.empty?
	end








	test "should build study with just ego" do
		assert_difference('Question.count',5) {
		assert_difference('Interview.count',1) {
		assert_difference('Study.count',1) {
			s = Study.create_with_ego
		} } }
	end

	test "should return study raw demographics with just ego" do
		s = Study.create_with_ego
		d = s.raw_demographics
		assert_equal d.length, 1
		assert_equal d.first[:subject], '001'
		assert d.first[:race].empty?
		assert d.first[:hisplat].empty?
		assert d.first[:sex].empty?
		assert d.first[:gender].empty?
	end

	test "should return study demographics with just ego" do
		s = Study.create_with_ego
		d = s.demographics
		assert_equal d.length, 1
		assert_equal d.first[:subject], "001"
		assert_equal d.first[:race], ["Unknown"]
		assert_equal d.first[:hisplat], ["Unknown"]
		assert_equal d.first[:sex], ["Unknown"]
		assert_equal d.first[:gender], ["Unknown"]
	end

	test "should return study demographics hash with just ego" do
		s = Study.create_with_ego
		d = s.demographics_hash
		assert_equal d[:id], s.id
		assert_equal d[:races], ["More Than One","Unknown"]
		assert_equal d[:hisplats], ["Unknown"]
		assert_equal d[:sexes], ["Unknown"]
		assert_equal d[:genders], ["Unknown"]
		dd=d[:demographics]
		assert_equal dd.length, 1
		assert_equal dd.first[:subject], "001"
		assert_equal dd.first[:race], ["Unknown"]
		assert_equal dd.first[:hisplat], ["Unknown"]
		assert_equal dd.first[:sex], ["Unknown"]
		assert_equal dd.first[:gender], ["Unknown"]
	end

	test "should return study nested demographics with just ego" do
		s = Study.create_with_ego
		d = s.nested_demographics
#	puts d.inspect
#	[{:id=>980191117, :subject=>"001", :race=>["Unknown"], :hisplat=>["Unknown"], :sex=>["Unknown"], :gender=>["Unknown"], :assoc=>[{:id=>980191117, :subject=>"001", :race=>["Unknown"], :hisplat=>["Unknown"], :sex=>["Unknown"], :gender=>["Unknown"], :assoc=>[]}]}]
		assert_equal d.length, 1
		assert_equal d.first[:assoc].length, 1
	end

	test "should return study nested raw demographics with just ego" do
		s = Study.create_with_ego
		d = s.nested_raw_demographics
#	puts d.inspect
#	[{:id=>980191122, :subject=>"001", :race=>[], :hisplat=>[], :sex=>[], :gender=>[], :assoc=>[{:id=>980191122, :subject=>"001", :race=>[], :hisplat=>[], :sex=>[], :gender=>[], :assoc=>[]}]}]
		assert_equal d.length, 1
		assert_equal d.first[:assoc].length, 1
	end

	test "should return study ego alter demographics with just ego" do
		s = Study.create_with_ego
		d = s.ego_alter_demographics
#	puts d.inspect
#	[{:id=>980191113, :subject=>"001", :race=>["Unknown"], :hisplat=>["Unknown"], :sex=>["Unknown"], :gender=>["Unknown"], :alters=>[]}]
		assert_equal d.length, 1
		assert d.first[:alters].empty?
	end







	test "should build study with ego and alter" do
		assert_difference('Question.count',5) {
		assert_difference('Interview.count',2) {
		assert_difference('Study.count',1) {
			s = Study.create_with_ego_and_alter
		} } }
	end

	test "should return study raw demographics with ego and alter" do
		s = Study.create_with_ego_and_alter
		d = s.raw_demographics
		assert_equal d.length, 2
		assert_equal d.first[:subject], '001'
		assert d.first[:race].empty?
		assert d.first[:hisplat].empty?
		assert d.first[:sex].empty?
		assert d.first[:gender].empty?
		assert_equal d.last[:subject], '001_1'
		assert d.last[:race].empty?
		assert d.last[:hisplat].empty?
		assert d.last[:sex].empty?
		assert d.last[:gender].empty?
	end

	test "should return study demographics with ego and alter" do
		s = Study.create_with_ego_and_alter
		d = s.demographics
		assert_equal d.length, 2
		assert_equal d.first[:subject], "001"
		assert_equal d.first[:race], ["Unknown"]
		assert_equal d.first[:hisplat], ["Unknown"]
		assert_equal d.first[:sex], ["Unknown"]
		assert_equal d.first[:gender], ["Unknown"]
		assert_equal d.last[:subject], "001_1"
		assert_equal d.last[:race], ["Unknown"]
		assert_equal d.last[:hisplat], ["Unknown"]
		assert_equal d.last[:sex], ["Unknown"]
		assert_equal d.last[:gender], ["Unknown"]
	end

	test "should return study demographics hash with ego and alter" do
		s = Study.create_with_ego_and_alter
		d = s.demographics_hash
		assert_equal d[:id], s.id
		assert_equal d[:races], ["More Than One","Unknown"]
		assert_equal d[:hisplats], ["Unknown"]
		assert_equal d[:sexes], ["Unknown"]
		assert_equal d[:genders], ["Unknown"]
		dd=d[:demographics]
		assert_equal dd.length, 2
		assert_equal dd.first[:subject], "001"
		assert_equal dd.first[:race], ["Unknown"]
		assert_equal dd.first[:hisplat], ["Unknown"]
		assert_equal dd.first[:sex], ["Unknown"]
		assert_equal dd.first[:gender], ["Unknown"]
		assert_equal dd.last[:subject], "001_1"
		assert_equal dd.last[:race], ["Unknown"]
		assert_equal dd.last[:hisplat], ["Unknown"]
		assert_equal dd.last[:sex], ["Unknown"]
		assert_equal dd.last[:gender], ["Unknown"]
	end

	test "should return study nested demographics with ego and alter" do
		s = Study.create_with_ego_and_alter
		d = s.nested_demographics
#	puts d.inspect
#	[{:id=>980191117, :subject=>"001", :race=>["Unknown"], :hisplat=>["Unknown"], :sex=>["Unknown"], :gender=>["Unknown"], :assoc=>[{:id=>980191117, :subject=>"001", :race=>["Unknown"], :hisplat=>["Unknown"], :sex=>["Unknown"], :gender=>["Unknown"], :assoc=>[]}]}]
		assert_equal d.length, 1
		assert_equal d.first[:assoc].length, 2
	end

	test "should return study nested raw demographics with ego and alter" do
		s = Study.create_with_ego_and_alter
		d = s.nested_raw_demographics
#	puts d.inspect
#	[{:id=>980191122, :subject=>"001", :race=>[], :hisplat=>[], :sex=>[], :gender=>[], :assoc=>[{:id=>980191122, :subject=>"001", :race=>[], :hisplat=>[], :sex=>[], :gender=>[], :assoc=>[]}]}]
		assert_equal d.length, 1
		assert_equal d.first[:assoc].length, 2
	end

	test "should return study ego alter demographics with ego and alter" do
		s = Study.create_with_ego_and_alter
		d = s.ego_alter_demographics
#	puts d.inspect
#	[{:id=>980191113, :subject=>"001", :race=>["Unknown"], :hisplat=>["Unknown"], :sex=>["Unknown"], :gender=>["Unknown"], :alters=>[]}]
		assert_equal d.length, 1
		assert_equal d.first[:alters].length, 1
	end










end
