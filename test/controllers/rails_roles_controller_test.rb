require 'test_helper'

class RailsRolesControllerTest < ActionDispatch::IntegrationTest

	%w{admin}.each do |login|

		test "should add role to user with #{login} login" do
			create_and_login_as(login)
			u = FactoryGirl.create(:rails_user)
			r = FactoryGirl.create(:rails_role)
			assert_difference("RailsUser.find(#{u.id}).rails_roles.length",1){
				put rails_user_rails_role_url(u,r.id)
			}
			assert_nil flash[:warn]
			assert_redirected_to u
		end

		test "should remove role from user with #{login} login" do
			create_and_login_as(login)
			u = FactoryGirl.create(:rails_user)
			r = FactoryGirl.create(:rails_role)
			u.rails_roles << r
			assert_difference("RailsUser.find(#{u.id}).rails_roles.length",-1){
				delete rails_user_rails_role_url(u,r.id)
			}
			assert_nil flash[:warn]
			assert_redirected_to u
		end

	end

	%w{nonadmin create read update destroy}.each do |login|

		test "should NOT add role to user with #{login} login" do
			create_and_login_as(login)
			u = FactoryGirl.create(:rails_user)
			r = FactoryGirl.create(:rails_role)
			assert_difference("RailsUser.find(#{u.id}).rails_roles.length",0){
				put rails_user_rails_role_url(u,r.id)
			}
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

		test "should remove role from user with #{login} login" do
			create_and_login_as(login)
			u = FactoryGirl.create(:rails_user)
			r = FactoryGirl.create(:rails_role)
			u.rails_roles << r
			assert_difference("RailsUser.find(#{u.id}).rails_roles.length",0){
				delete rails_user_rails_role_url(u,r.id)
			}
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

	end

end
