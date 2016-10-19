require 'test_helper'

class InterviewerTest < ActiveSupport::TestCase
	# test "the truth" do
	#	 assert true
	# end

	test "responds to study" do
		assert_nil self.class.name.gsub(/Test$/,'').constantize.new.study
	end

	test "responds to alter_lists" do
		assert_empty self.class.name.gsub(/Test$/,'').constantize.new.alter_lists
	end

end
