require 'test_helper'

class AlterListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

	test "responds to study" do
		assert_nil self.class.name.gsub(/Test$/,'').constantize.new.study
	end

	test "responds to interviewer" do
		assert_nil self.class.name.gsub(/Test$/,'').constantize.new.interviewer
	end

end
