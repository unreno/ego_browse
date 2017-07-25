require 'test_helper'

class RailsUsersControllerTest < ActionDispatch::IntegrationTest

	%w{admin}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get rails_users_url
			assert_nil flash[:warn]
			assert_response :success
		end

		test "should get new with #{login} login" do
			create_and_login_as(login)
			get new_rails_user_url
			assert_nil flash[:warn]
			assert_response :success
		end

		test "should create rails_user with #{login} login" do
			create_and_login_as(login)
			assert_difference('RailsUser.count') do
				post rails_users_url, params: { rails_user: rails_user_params }
			end
			assert_redirected_to rails_user_url(assigns :rails_user)
		end
	
		test "should not create rails_user with #{login} login if save fails" do
			create_and_login_as(login)
			RailsUser.any_instance.stubs(:create_or_update).returns(false)
			assert_difference('RailsUser.count',0) do
				post rails_users_url, params: { rails_user: rails_user_params }
			end
			assert_response :success
			assert_template :new
		end

		test "should get edit with #{login} login" do
			create_and_login_as(login)
			@rails_user = FactoryGirl.create(:rails_user)
			get edit_rails_user_url(@rails_user)
			assert_response :success
		end

		test "should update rails_user with #{login} login" do
			create_and_login_as(login)
			@rails_user = FactoryGirl.create(:rails_user)
			patch rails_user_url(@rails_user), params: { rails_user: { login: 'updated_login' } }
			assert_redirected_to rails_user_url(@rails_user)
		end

		test "should not update rails_user with #{login} login if save fails" do
			create_and_login_as(login)
			@rails_user = FactoryGirl.create(:rails_user)
			RailsUser.any_instance.stubs(:create_or_update).returns(false)
			patch rails_user_url(@rails_user), params: { rails_user: { login: 'updated_login' } }
			assert_response :success
			assert_template :edit
		end
	
		test "should get show with #{login} login" do
			create_and_login_as(login)
			@rails_user = FactoryGirl.create(:rails_user)
			get rails_user_url(@rails_user)
			assert_response :success
		end
	
		test "should destroy rails_user with #{login} login" do
			create_and_login_as(login)
			@rails_user = FactoryGirl.create(:rails_user)
			assert_difference('RailsUser.count', -1) do
				delete rails_user_url(@rails_user)
			end
			assert_redirected_to rails_users_url
		end

	end

	%w{nonadmin create read update destroy}.each do |login|

		test "should NOT get index with #{login} login" do
			create_and_login_as(login)
			get rails_users_url
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

		test "should NOT get new with #{login} login" do
			create_and_login_as(login)
			get new_rails_user_url
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

		test "should NOT post create with #{login} login" do
			create_and_login_as(login)
			assert_difference('RailsUser.count',0) do
				post rails_users_url, params: { rails_user: rails_user_params }
			end
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

		test "should NOT get show with #{login} login" do
			create_and_login_as(login)
			@rails_user = FactoryGirl.create(:rails_user)
			get rails_user_url(@rails_user)
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end
	
		test "should NOT destroy rails_user with #{login} login" do
			create_and_login_as(login)
			@rails_user = FactoryGirl.create(:rails_user)
			assert_difference('RailsUser.count', 0) do
				delete rails_user_url(@rails_user)
			end
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

	end



	def rails_user_params(options={})
		{	
			login: 'new_rails_user',
			password: 'alphaV@1!d', 
			password_confirmation: 'alphaV@1!d' 
		}.merge(options)
	end

end
