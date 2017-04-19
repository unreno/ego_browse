require 'test_helper'

class TestingFacilitationTest < ActiveSupport::TestCase

	test "should limit interview notes to 65500" do
		i = FactoryGirl.build( :testing_facilitation, notes: "x"*65500 )
		assert i.valid?
		i = FactoryGirl.build( :testing_facilitation, notes: "x"*65501 )
		assert !i.valid?
	end

end
