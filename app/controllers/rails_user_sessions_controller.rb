class RailsUserSessionsController < ApplicationController
	skip_before_action :require_user, :only => [:new, :create]
	skip_before_action :require_user_can_create, :only => [:new, :create]
	skip_before_action :require_user_can_destroy, :only => [:destroy]
	before_action :require_no_user, :only => [:new, :create]

	def new
		@rails_user_session = RailsUserSession.new
	end

	def create
		@rails_user_session = RailsUserSession.new(rails_user_session_params.to_h)
		if @rails_user_session.save
			flash[:notice] = "Login successful!"
			redirect_back_or_default root_url
		else
			render :action => :new
		end
	end

	def destroy
		current_user_session.destroy
		flash[:notice] = "Logout successful!"
		redirect_back_or_default new_rails_user_session_url
	end

	private

	def rails_user_session_params
		params.require(:rails_user_session).permit(:login, :password)
	end
end
