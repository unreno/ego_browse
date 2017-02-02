require 'test_helper'

class AlterReferralSheetsControllerTest < ActionDispatch::IntegrationTest

	setup do
		@alter_referral_sheet = alter_referral_sheets(:one)
	end

	%w{admin nonadmin}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get alter_referral_sheets_url
			assert_response :success
		end
	
		test "should show alter_referral_sheet with #{login} login" do
			create_and_login_as(login)
			get alter_referral_sheet_url(@alter_referral_sheet)
			assert_response :success
		end
	
	end

	%w{admin}.each do |login|

		test "should get new with #{login} login" do
			create_and_login_as(login)
			get new_alter_referral_sheet_url
			assert_response :success
		end
	
		test "should create alter_referral_sheet with #{login} login" do
			create_and_login_as(login)
			assert_difference('AlterReferralSheet.count') do
				post alter_referral_sheets_url, params: { alter_referral_sheet: { ego_id: @alter_referral_sheet.ego_id } }
			end
			assert_redirected_to alter_referral_sheet_url(AlterReferralSheet.last)
		end
	
		test "should not create alter_referral_sheet with #{login} login if save fails" do
			create_and_login_as(login)
			AlterReferralSheet.any_instance.stubs(:create_or_update).returns(false)
			assert_difference('AlterReferralSheet.count',0) do
				post alter_referral_sheets_url, params: { alter_referral_sheet: { ego_id: @alter_referral_sheet.ego_id } }
			end
			assert_response :success
			assert_template :new
		end
	
		test "should get edit with #{login} login" do
			create_and_login_as(login)
			get edit_alter_referral_sheet_url(@alter_referral_sheet)
			assert_response :success
		end
	
		test "should update alter_referral_sheet with #{login} login" do
			create_and_login_as(login)
			patch alter_referral_sheet_url(@alter_referral_sheet), params: { alter_referral_sheet: { ego_id: @alter_referral_sheet.ego_id } }
			assert_redirected_to alter_referral_sheet_url(@alter_referral_sheet)
		end
	
		test "should not update alter_referral_sheet with #{login} login if save fails" do
			create_and_login_as(login)
			AlterReferralSheet.any_instance.stubs(:create_or_update).returns(false)
			patch alter_referral_sheet_url(@alter_referral_sheet), params: { alter_referral_sheet: { ego_id: @alter_referral_sheet.ego_id } }
			assert_response :success
			assert_template :edit
		end
	
		test "should destroy alter_referral_sheet with #{login} login" do
			create_and_login_as(login)
			assert_difference('AlterReferralSheet.count', -1) do
				delete alter_referral_sheet_url(@alter_referral_sheet)
			end
			assert_redirected_to alter_referral_sheets_url
		end

	end

	%w{noadmin}.each do |login|

		test "should not get new with #{login} login" do
			create_and_login_as(login)
			get new_alter_referral_sheet_url
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
		test "should not create alter_referral_sheet with #{login} login" do
			create_and_login_as(login)
			assert_difference('AlterReferralSheet.count',0) do
				post alter_referral_sheets_url, params: { alter_referral_sheet: { ego_id: @alter_referral_sheet.ego_id } }
			end
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
		test "should not get edit with #{login} login" do
			create_and_login_as(login)
			get edit_alter_referral_sheet_url(@alter_referral_sheet)
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
		test "should not update alter_referral_sheet with #{login} login" do
			create_and_login_as(login)
			patch alter_referral_sheet_url(@alter_referral_sheet), params: { alter_referral_sheet: { ego_id: @alter_referral_sheet.ego_id } }
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
		test "should not destroy alter_referral_sheet with #{login} login" do
			create_and_login_as(login)
			assert_difference('AlterReferralSheet.count', 0) do
				delete alter_referral_sheet_url(@alter_referral_sheet)
			end
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end

	end

#	TODO add failed nologin tests

end
