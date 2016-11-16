class RailsUserSessionsController < ApplicationController

	skip_before_action :require_user, :only => [:new, :create]


#	Authlogic::Session::Base.controller = Authlogic::ControllerAdapters::RailsAdapter.new(self)

	def new
		@rails_user_session = RailsUserSession.new
	end

	def create
		@rails_user_session = RailsUserSession.new(params[:rails_user_session].to_hash)
		if @rails_user_session.save
			flash[:notice] = "Login successful!"
			redirect_back_or_default root_url
		else
			render :action => :new
		end
	end

	def destroy
		current_rails_user_session.destroy
		flash[:notice] = "Logout successful!"
		redirect_back_or_default new_rails_user_session_url
	end
end
