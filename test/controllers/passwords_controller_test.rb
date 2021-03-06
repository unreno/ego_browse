require 'test_helper'

class PasswordsControllerTest < ActionDispatch::IntegrationTest	#ActionController::TestCase

	test "should edit password with self login" do
		rails_user = create_and_login_as('randomuser')
		get edit_password_url
		assert_response :success
		assert_template 'edit'
	end

	test "should update password with self login" do
		rails_user = create_and_login_as('randomuser')
		put password_url, params: { rails_user: password_attributes }
		assert_not_nil flash[:notice]
		assert_redirected_to root_path
	end

	test "should NOT update rails_user without current password" do
		rails_user = create_and_login_as('randomuser')
		put password_url, params: { rails_user: password_attributes(:current_password => '') }
		assert_not_nil flash[:error]
		assert_redirected_to edit_password_path
	end

	test "should NOT update rails_user without valid current password" do
		rails_user = create_and_login_as('randomuser')
		put password_path, params: { rails_user: password_attributes(:current_password => 'iforgot') }
		assert_not_nil flash[:error]
		assert_redirected_to edit_password_path
	end

	test "should NOT update rails_user without password" do
		rails_user = create_and_login_as('randomuser')
		put password_path, params: { rails_user: password_attributes(:password => '') }
#		assert_not_nil flash[:error]
#		assert_response :success
#		assert_template 'edit'
#	No password, no update attempt
		assert_not_nil flash[:warn]
		assert_redirected_to root_path
	end

	test "should NOT update rails_user without password confirmation" do
		rails_user = create_and_login_as('randomuser')
		put password_path, params: { rails_user: password_attributes(:password_confirmation => '') }
		assert_response :success
		assert_template 'edit'
		assert_not_nil flash[:error]
	end

	test "should NOT update rails_user without password and password confirmation" do
		rails_user = create_and_login_as('randomuser')
		put password_path, params: { rails_user: password_attributes(
			:password => '', 
			:password_confirmation => '' ) }
		assert_not_nil flash[:warn]
		assert_redirected_to root_path
	end

	test "should NOT update rails_user without complex password" do
		rails_user = create_and_login_as('randomuser')
		put password_path, params: { rails_user: password_attributes(
			:password              => 'mybigbadpassword',
			:password_confirmation => 'mybigbadpassword' ) }
		assert_response :success
		assert_template 'edit'
		assert_not_nil flash[:error]
	end

	test "should NOT update rails_user without matching password and confirmation" do
		rails_user = create_and_login_as('randomuser')
		put password_path, params: { rails_user: password_attributes(
			:password_confirmation => 'betaV@1!d' ) }
		assert_response :success
		assert_template 'edit'
		assert_not_nil flash[:error]
	end

	test "should NOT edit password without login" do
		get edit_password_path
		assert_not_nil flash[:warn]
		assert_redirected_to new_rails_user_session_path
	end

	test "should NOT update password without login" do
		put password_path, params: { rails_user: password_attributes }
		assert_not_nil flash[:warn]
		assert_redirected_to new_rails_user_session_path
	end

protected

	def password_attributes(options={})
		{	:current_password => 'Test123!',
			:password => 'alphaV@1!d', 
			:password_confirmation => 'alphaV@1!d' 
		}.merge(options)
	end

end
