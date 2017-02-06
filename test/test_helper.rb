require 'simplecov_test_helper'	#	should be first for some reason

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
	# Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
	fixtures :all

	# Add more helper methods to be used by all tests here...

end

Study.class_eval do

	def self.create_empty
		s = Study.create!(name:'Study Name',userId:0,hideEgoIdPage:true)
	#	s.interviews.create!
		s.questions.create!(title: 'GENDER')
		s.questions.create!(title: 'HISPLAT')
		s.questions.create!(title: 'RACE')
		s.questions.create!(title: 'SUBJECT')
		s.questions.create!(title: 'SEX')
		s
	end

	def add_subject( subjectid='001' )
		i = interviews.create!	
		qid = subject_qid
		i.answers.create!(questionId: qid, value: MCRYPT.myencrypt(subjectid))
		i
	end

	def self.create_with_ego( subjectid='001' )
		s = create_empty
		s.add_subject( subjectid )
		s
	end

	def self.create_with_ego_and_alter( subjectids=['001','001_1'] )
		s = create_empty
		subjectids.each do |subjectid|
			s.add_subject( subjectid )
		end
		s
	end

	def self.create_with( subjects={} )
		s = create_empty
		subjects.each do |subject|
			i = s.add_subject( subject[:subjectid] ) 
			i.add_races( subject[:races]||[] )
			i.add_sexes( subject[:sexes]||[] )
			i.add_genders( subject[:genders]||[] )
			i.add_hisplats( subject[:hisplats]||[] )
		end
		s
	end

end
Interview.class_eval do

	def add_races( values=[] )
		unless values.empty?
			qid = study.race_qid
			ids = values.collect do |value|
				Question.find(qid).question_options.find_or_create_by(studyId:study.id,name:value).id
			end
			a = answers.create!(questionId: qid, value: MCRYPT.myencrypt(ids.join(',')))
		end
	end

	def add_sexes( values=[] )
		unless values.empty?
			qid = study.sex_qid
			ids = values.collect do |value|
				Question.find(qid).question_options.find_or_create_by(studyId:study.id,name:value).id
			end
			answers.create!(questionId: qid, value: MCRYPT.myencrypt(ids.join(',')))
		end
	end

	def add_genders( values=[] )
		unless values.empty?
			qid = study.gender_qid
			ids = values.collect do |value|
				Question.find(qid).question_options.find_or_create_by(studyId:study.id,name:value).id
			end
			answers.create!(questionId: qid, value: MCRYPT.myencrypt(ids.join(',')))
		end
	end

	def add_hisplats( values=[] )
		unless values.empty?
			qid = study.hisplat_qid
			ids = values.collect do |value|
				Question.find(qid).question_options.find_or_create_by(studyId:study.id,name:value).id
			end
			answers.create!(questionId: qid, value: MCRYPT.myencrypt(ids.join(',')))
		end
	end

end

#ApplicationController.skip_before_action :require_user

#	Effectively skips the admin requirement.
#ApplicationController.send(:define_method,:require_admin){true}

#class ApplicationController
#	def require_admin
#		true
#	end
#end




class ActionDispatch::IntegrationTest

	def create_and_login_as( login='test@here.com' )
		user = RailsUser.create!({
			login: login,
			password: 'Test123!', password_confirmation: 'Test123!' })
#			approved: true, confirmed: true, active: true })
		post rails_user_session_url, params: { rails_user_session: {
			login: login,
			password: 'Test123!'
		} }
	end
	alias :create_and_login :create_and_login_as

	def successfully_create_and_login_as( login='test@here.com' )
		assert_difference('RailsUser.count',1) do
			create_and_login_as( login )
			assert_not_nil flash[:notice]
			assert_redirected_to root_url
			follow_redirect!
		end
	end
	alias :successfully_create_and_login :successfully_create_and_login_as

#	def logout
#		UserSession.find.try(:destroy)
#	end
#
#	def assert_redirected_to_login
#		assert_not_nil flash[:error]
#		assert_redirected_to login_path
#	end
#
#	def assert_redirected_to_logout
#		assert_redirected_to logout_path
#	end

end

require 'mocha/mini_test'
