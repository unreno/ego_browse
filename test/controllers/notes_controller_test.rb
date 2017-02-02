require 'test_helper'

class NotesControllerTest < ActionDispatch::IntegrationTest

	%w{admin nonadmin}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get notes_url
			assert_response :success
		end

		test "should show note with #{login} login" do
			create_and_login_as(login)
			@note = notes(:one)
			get note_url(@note)
			assert_response :success
		end

	end

	test "should get index without login" do
		get notes_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

	test "should show note without login" do
		@note = notes(:one)
		get note_url(@note)
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

end
