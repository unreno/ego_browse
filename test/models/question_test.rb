require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
	# test "the truth" do
	#	 assert true
	# end

	test "responds to study" do
		assert_nil self.class.name.gsub(/Test$/,'').constantize.new.study
	end

	test "responds to answers" do
		assert_empty self.class.name.gsub(/Test$/,'').constantize.new.answers
	end

	test "responds to expressions" do
		assert_empty self.class.name.gsub(/Test$/,'').constantize.new.expressions
	end

	test "responds to legends" do
		assert_empty self.class.name.gsub(/Test$/,'').constantize.new.legends
	end

	test "responds to question_options" do
		assert_empty self.class.name.gsub(/Test$/,'').constantize.new.question_options
	end

end
