require 'test_helper'

class StaticsControllerTest < ActionDispatch::IntegrationTest

	%w{admin nonadmin create read update destroy}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get statics_url
			assert_response :success
		end

		test "should get reports with #{login} login" do
			create_and_login_as(login)
			get reports_statics_url
			assert_response :success
		end

		test "should get demographic_counts with #{login} login" do
			create_and_login_as(login)
			get demographic_counts_statics_url
			assert_response :success
		end

		test "should get black_demographic_counts with #{login} login" do
			create_and_login_as(login)
			get black_demographic_counts_statics_url
			assert_response :success
		end

		test "should get latina_demographic_counts with #{login} login" do
			create_and_login_as(login)
			get latina_demographic_counts_statics_url
			assert_response :success
		end

		test "should get trans_demographic_counts with #{login} login" do
			create_and_login_as(login)
			get trans_demographic_counts_statics_url
			assert_response :success
		end

		test "should get leftover_demographic_counts with #{login} login" do
			create_and_login_as(login)
			get leftover_demographic_counts_statics_url
			assert_response :success
		end

		test "should get alters_per_ego with #{login} login" do
			create_and_login_as(login)
			get alters_per_ego_statics_url
			assert_response :success
		end


		test "should get sti_counts with #{login} login" do
			create_and_login_as(login)
			get sti_counts_statics_url
			assert_response :success
		end




		test "should get demographic_counts with #{login} login and empty study" do
			Study.create_empty
			create_and_login_as(login)
			get demographic_counts_statics_url
			assert_response :success
		end

		test "should get black_demographic_counts with #{login} login and empty study" do
			Study.create_empty
			create_and_login_as(login)
			get black_demographic_counts_statics_url
			assert_response :success
		end

		test "should get latina_demographic_counts with #{login} login and empty study" do
			Study.create_empty
			create_and_login_as(login)
			get latina_demographic_counts_statics_url
			assert_response :success
		end

		test "should get trans_demographic_counts with #{login} login and empty study" do
			Study.create_empty
			create_and_login_as(login)
			get trans_demographic_counts_statics_url
			assert_response :success
		end

		test "should get leftover_demographic_counts with #{login} login and empty study" do
			Study.create_empty
			create_and_login_as(login)
			get leftover_demographic_counts_statics_url
			assert_response :success
		end

		test "should get alters_per_ego with #{login} login and empty study" do
			Study.create_empty
			create_and_login_as(login)
			get alters_per_ego_statics_url
			assert_response :success
		end



		test "should get demographic_counts with #{login} login and ego and alter study" do
			Study.create_with_ego_and_alter
			create_and_login_as(login)
			get demographic_counts_statics_url
			assert_response :success
		end

		test "should get black_demographic_counts with #{login} login and ego and alter study" do
			Study.create_with_ego_and_alter
			create_and_login_as(login)
			get black_demographic_counts_statics_url
			assert_response :success
		end

		test "should get latina_demographic_counts with #{login} login and ego and alter study" do
			Study.create_with_ego_and_alter
			create_and_login_as(login)
			get latina_demographic_counts_statics_url
			assert_response :success
		end

		test "should get trans_demographic_counts with #{login} login and ego and alter study" do
			Study.create_with_ego_and_alter
			create_and_login_as(login)
			get trans_demographic_counts_statics_url
			assert_response :success
		end

		test "should get leftover_demographic_counts with #{login} login and ego and alter study" do
			Study.create_with_ego_and_alter
			create_and_login_as(login)
			get leftover_demographic_counts_statics_url
			assert_response :success
		end

		test "should get alters_per_ego with #{login} login and ego and alter study" do
			Study.create_with_ego_and_alter
			create_and_login_as(login)
			get alters_per_ego_statics_url
			assert_response :success
		end




		test "should get black_demographic_counts with #{login} login and black ego and alter study" do
			s = Study.create_with([
				{subject: '001', races: ['African']},
				{subject: '001_1'}
			])
			create_and_login_as(login)
			get black_demographic_counts_statics_url
			assert_response :success
		end

		test "should get latina_demographic_counts with #{login} login and non-black latina ego and alter study" do
			Study.create_with([
				{subject: '001', hisplats: ['Yes']},
				{subject: '001_1'}
			])
			create_and_login_as(login)
			get latina_demographic_counts_statics_url
			assert_response :success
		end

		test "should get trans_demographic_counts with #{login} login and non-black, non-latina, trans ego and alter study" do
			Study.create_with([
				{subject: '001', genders: ['Transfemale']},
				{subject: '001_1'}
			])
			create_and_login_as(login)
			get trans_demographic_counts_statics_url
			assert_response :success
		end

		#	Shouldn't really ever happen
		test "should get leftover_demographic_counts with #{login} login and male ego and alter study" do
			Study.create_with([
				{subject: '001', sexes: ['Male']},
				{subject: '001_1'}
			])
			create_and_login_as(login)
			get leftover_demographic_counts_statics_url
			assert_response :success
		end






#		test "should get sti_counts with #{login} login and empty study" do
#			Study.create_empty
#			create_and_login_as(login)
#			get sti_counts_statics_url
#			assert_response :success
#		end




	end

	test "should not get index without login" do
		get statics_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

	test "should not get reports login" do
		get reports_statics_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

end
