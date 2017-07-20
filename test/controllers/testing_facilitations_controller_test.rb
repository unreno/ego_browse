require 'test_helper'

class TestingFacilitationsControllerTest < ActionDispatch::IntegrationTest

	setup do
		@testing_facilitation = FactoryGirl.create(:testing_facilitation)
	end

	%w{admin dataentry readonly}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get testing_facilitations_url
			assert_response :success
		end
	
		test "should get index.csv with #{login} login" do
			create_and_login_as(login)
			get testing_facilitations_url( format: 'csv' )
			assert_response :success
		end
	
		test "should show testing_facilitation with #{login} login" do
			create_and_login_as(login)
			get testing_facilitation_url(@testing_facilitation)
			assert_response :success
		end
	
	end

	%w{admin dataentry}.each do |login|

		test "should get new with #{login} login" do
			create_and_login_as(login)
			get new_testing_facilitation_url
			assert_response :success
		end
	
		test "should create testing_facilitation with #{login} login" do
			create_and_login_as(login)
			params = FactoryGirl.build(:testing_facilitation).attributes
				.except('id','created_at','updated_at')
			assert_difference('TestingFacilitation.count') do
				post testing_facilitations_url, params: { testing_facilitation: params }
			end
			assert_redirected_to testing_facilitation_url(TestingFacilitation.last)
		end
	
		test "should not create testing_facilitation with #{login} login if save fails" do
			create_and_login_as(login)
			TestingFacilitation.any_instance.stubs(:create_or_update).returns(false)
			params = FactoryGirl.build(:testing_facilitation).attributes
				.except('id','created_at','updated_at')
			assert_difference('TestingFacilitation.count',0) do
				post testing_facilitations_url, params: { testing_facilitation: params }
			end
			assert_response :success
			assert_template :new
		end
	
	end

	%w{admin}.each do |login|

		test "should get edit with #{login} login" do
			create_and_login_as(login)
			get edit_testing_facilitation_url(@testing_facilitation)
			assert_response :success
		end
	
		test "should update testing_facilitation with #{login} login" do
			create_and_login_as(login)
			params = FactoryGirl.build(:testing_facilitation).attributes
				.except('id','created_at','updated_at')
			patch testing_facilitation_url(@testing_facilitation), params: { testing_facilitation: params }
			assert_redirected_to testing_facilitation_url(@testing_facilitation)
		end

		test "should not update testing_facilitation with #{login} login if save fails" do
			create_and_login_as(login)
			TestingFacilitation.any_instance.stubs(:create_or_update).returns(false)
			params = FactoryGirl.build(:testing_facilitation).attributes
				.except('id','created_at','updated_at')
			patch testing_facilitation_url(@testing_facilitation), params: { testing_facilitation: params }
			assert_response :success
			assert_template :edit
		end
	
		test "should destroy testing_facilitation with #{login} login" do
			create_and_login_as(login)
			assert_difference('TestingFacilitation.count', -1) do
				delete testing_facilitation_url(@testing_facilitation)
			end
			assert_redirected_to testing_facilitations_url
		end

	end

	%w{readonly}.each do |login|

		test "should not get new with #{login} login" do
			create_and_login_as(login)
			get new_testing_facilitation_url
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
		test "should not create testing_facilitation with #{login} login" do
			create_and_login_as(login)
			params = FactoryGirl.build(:testing_facilitation).attributes
				.except('id','created_at','updated_at')
			assert_difference('TestingFacilitation.count',0) do
				post testing_facilitations_url, params: { testing_facilitation: params }
			end
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end

	end
	
	%w{dataentry readonly}.each do |login|

		test "should not get edit with #{login} login" do
			create_and_login_as(login)
			get edit_testing_facilitation_url(@testing_facilitation)
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
		test "should not update testing_facilitation with #{login} login" do
			create_and_login_as(login)
			params = FactoryGirl.build(:testing_facilitation).attributes
				.except('id','created_at','updated_at')
			patch testing_facilitation_url(@testing_facilitation), params: { testing_facilitation: params }
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
		test "should not destroy testing_facilitation with #{login} login" do
			create_and_login_as(login)
			assert_difference('TestingFacilitation.count', 0) do
				delete testing_facilitation_url(@testing_facilitation)
			end
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end

	end

#	TODO add failed nologin tests

end
