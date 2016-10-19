require 'test_helper'

class StudyTest < ActiveSupport::TestCase
	# test "the truth" do
	#	 assert true
	# end

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

end
