require 'test_helper'

class EligibilityScreeningsControllerTest < ActionDispatch::IntegrationTest

	setup do
		@eligibility_screening = FactoryGirl.create(:eligibility_screening)
	end

	%w{admin dataentry readonly}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get eligibility_screenings_url
			assert_response :success
		end
	
		test "should get index.csv with #{login} login" do
			create_and_login_as(login)
			get eligibility_screenings_url( format: 'csv' )
			assert_response :success
		end
	
		test "should show eligibility_screening with #{login} login" do
			create_and_login_as(login)
			get eligibility_screening_url(@eligibility_screening)
			assert_response :success
		end
	
	end

	%w{admin dataentry}.each do |login|

		test "should get new with #{login} login" do
			create_and_login_as(login)
			get new_eligibility_screening_url
			assert_response :success
		end
	
		test "should create eligibility_screening with #{login} login" do
			create_and_login_as(login)
			params = FactoryGirl.build(:eligibility_screening).attributes
				.except('id','created_at','updated_at')
			assert_difference('EligibilityScreening.count') do
				post eligibility_screenings_url, params: { eligibility_screening: params }
			end
			assert_redirected_to eligibility_screening_url(EligibilityScreening.last)
		end

		test "should not create eligibility_screening with #{login} login if save fails" do
			create_and_login_as(login)
			params = FactoryGirl.build(:eligibility_screening).attributes
				.except('id','created_at','updated_at')
			EligibilityScreening.any_instance.stubs(:create_or_update).returns(false)
			assert_difference('EligibilityScreening.count',0) do
				post eligibility_screenings_url, params: { eligibility_screening: params }
			end
			assert_response :success
			assert_template :new
		end
	
	end

	%w{admin}.each do |login|

		test "should get edit with #{login} login" do
			create_and_login_as(login)
			get edit_eligibility_screening_url(@eligibility_screening)
			assert_response :success
		end
	
		test "should update eligibility_screening with #{login} login" do
			create_and_login_as(login)
			params = FactoryGirl.build(:eligibility_screening).attributes
				.except('id','created_at','updated_at')
			patch eligibility_screening_url(@eligibility_screening), params: { eligibility_screening: params }
			assert_redirected_to eligibility_screening_url(@eligibility_screening)
		end
	
		test "should not update eligibility_screening with #{login} login if save fails" do
			create_and_login_as(login)
			params = FactoryGirl.build(:eligibility_screening).attributes
				.except('id','created_at','updated_at')
			EligibilityScreening.any_instance.stubs(:create_or_update).returns(false)
			patch eligibility_screening_url(@eligibility_screening), params: { eligibility_screening: params }
			assert_response :success
			assert_template :edit
		end
	
		test "should destroy eligibility_screening with #{login} login" do
			create_and_login_as(login)
			assert_difference('EligibilityScreening.count', -1) do
				delete eligibility_screening_url(@eligibility_screening)
			end
			assert_redirected_to eligibility_screenings_url
		end
	end

	%w{dataentry readonly}.each do |login|

		test "should not get edit with #{login} login" do
			create_and_login_as(login)
			get edit_eligibility_screening_url(@eligibility_screening)
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
		test "should not update eligibility_screening with #{login} login" do
			create_and_login_as(login)
			params = FactoryGirl.build(:eligibility_screening).attributes
				.except('id','created_at','updated_at')
			patch eligibility_screening_url(@eligibility_screening), params: { eligibility_screening: params }
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
		test "should not destroy eligibility_screening with #{login} login" do
			create_and_login_as(login)
			assert_difference('EligibilityScreening.count', 0) do
				delete eligibility_screening_url(@eligibility_screening)
			end
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end

	end

	%w{readonly}.each do |login|

		test "should not get new with #{login} login" do
			create_and_login_as(login)
			get new_eligibility_screening_url
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
		test "should not create eligibility_screening with #{login} login" do
			create_and_login_as(login)
			params = FactoryGirl.build(:eligibility_screening).attributes
				.except('id','created_at','updated_at')
			assert_difference('EligibilityScreening.count',0) do
				post eligibility_screenings_url, params: { eligibility_screening: params }
			end
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
	end

#	TODO add failed nologin tests

end
