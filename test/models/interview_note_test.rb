require 'test_helper'

class InterviewNoteTest < ActiveSupport::TestCase

	test "should limit interview notes to 65500" do
		i = FactoryGirl.build( :interview_note, interview_notes: "x"*65500 )
		assert i.valid?
		i = FactoryGirl.build( :interview_note, interview_notes: "x"*65501 )
		assert !i.valid?
	end

end
