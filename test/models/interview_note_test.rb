require 'test_helper'

class InterviewNoteTest < ActiveSupport::TestCase

	test "should limit interview notes to 65500" do
		i = FactoryBot.build( :interview_note, interview_notes: "x"*65500 )
		assert i.valid?
		i = FactoryBot.build( :interview_note, interview_notes: "x"*65501 )
		assert !i.valid?
	end

	test "should limit ars number to 10" do
		i = FactoryBot.build( :interview_note, ars_number: "x"*10 )
		assert i.valid?
		i = FactoryBot.build( :interview_note, ars_number: "x"*11 )
		assert !i.valid?
	end

end
