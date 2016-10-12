require 'test_helper'

class GraphTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

	test "responds to expression" do
		assert_nil self.class.name.gsub(/Test$/,'').constantize.new.expression
	end

	test "responds to interview" do
		assert_nil self.class.name.gsub(/Test$/,'').constantize.new.interview
	end

end
