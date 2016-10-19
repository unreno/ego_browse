require 'test_helper'

class QuestionOptionTest < ActiveSupport::TestCase
	# test "the truth" do
	#	 assert true
	# end

	test "responds to question" do
		assert_nil self.class.name.gsub(/Test$/,'').constantize.new.question
	end

	test "responds to study" do
		assert_nil self.class.name.gsub(/Test$/,'').constantize.new.study
	end

end
