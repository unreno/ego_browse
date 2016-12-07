require 'test_helper'

class AlterReferralSheetsControllerTest < ActionDispatch::IntegrationTest
	setup do
		@alter_referral_sheet = alter_referral_sheets(:one)
	end

	test "should get index" do
		get alter_referral_sheets_url
		assert_response :success
	end

	test "should get new" do
		get new_alter_referral_sheet_url
		assert_response :success
	end

	test "should create alter_referral_sheet" do
		assert_difference('AlterReferralSheet.count') do
			post alter_referral_sheets_url, params: { alter_referral_sheet: { ego_id: @alter_referral_sheet.ego_id } }
		end

		assert_redirected_to alter_referral_sheet_url(AlterReferralSheet.last)
	end

	test "should show alter_referral_sheet" do
		get alter_referral_sheet_url(@alter_referral_sheet)
		assert_response :success
	end

	test "should get edit" do
		get edit_alter_referral_sheet_url(@alter_referral_sheet)
		assert_response :success
	end

	test "should update alter_referral_sheet" do
		patch alter_referral_sheet_url(@alter_referral_sheet), params: { alter_referral_sheet: { ego_id: @alter_referral_sheet.ego_id } }
		assert_redirected_to alter_referral_sheet_url(@alter_referral_sheet)
	end

	test "should destroy alter_referral_sheet" do
		assert_difference('AlterReferralSheet.count', -1) do
			delete alter_referral_sheet_url(@alter_referral_sheet)
		end

		assert_redirected_to alter_referral_sheets_url
	end
end
