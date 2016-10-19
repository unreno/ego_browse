require 'test_helper'

class ExpressionTest < ActiveSupport::TestCase
	# test "the truth" do
	#	 assert true
	# end

	test "responds to study" do
		assert_nil self.class.name.gsub(/Test$/,'').constantize.new.study
	end

	test "responds to question" do
		assert_nil self.class.name.gsub(/Test$/,'').constantize.new.question
	end

	test "responds to notes" do
		assert_empty self.class.name.gsub(/Test$/,'').constantize.new.notes
	end

	test "responds to graphs" do
		assert_empty self.class.name.gsub(/Test$/,'').constantize.new.graphs
	end

end
