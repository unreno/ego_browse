require 'test_helper'

class MatchedAlterTest < ActiveSupport::TestCase
	# test "the truth" do
	#	 assert true
	# end

	test "responds to study" do
		assert_nil self.class.name.gsub(/Test$/,'').constantize.new.study
	end

	test "responds to alter1" do
		assert_nil self.class.name.gsub(/Test$/,'').constantize.new.alter1
	end

	test "responds to alter2" do
		assert_nil self.class.name.gsub(/Test$/,'').constantize.new.alter2
	end

end
