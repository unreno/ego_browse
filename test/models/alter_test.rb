require 'test_helper'

class AlterTest < ActiveSupport::TestCase
	# test "the truth" do
	#	 assert true
	# end

	test "responds to alter_list" do
		assert_nil self.class.name.gsub(/Test$/,'').constantize.new.alter_list
	end

	test "responds to interview" do
		assert_nil self.class.name.gsub(/Test$/,'').constantize.new.interview
	end

	test "responds to notes" do
		assert_empty self.class.name.gsub(/Test$/,'').constantize.new.notes
	end

	test "responds to other_specifies" do
		assert_empty self.class.name.gsub(/Test$/,'').constantize.new.other_specifies
	end

end
