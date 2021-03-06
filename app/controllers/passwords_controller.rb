class PasswordsController < ApplicationController
	skip_before_action :require_user_can_update	#, :only => [:update]

#	Other than the default login_required, there seems
#	to be no need of other filters.  This edits the
#	current_user's password, so no id needed.

#	before_filter :validate_current_password, :only => :update
	before_action :validate_current_password, :only => :update

	def update
		if params[:rails_user].present? && 
				params[:rails_user][:password].blank? #&&
#				params[:rails_user][:password_confirmation].blank?
			flash[:warn] = "Password was NOT provided so NOT updated."
#			redirect_to rails_user_path(current_user)
			redirect_to root_path
		else
			current_user.update_attributes!(rails_user_params)

			#
			#	Changing the password resets the persistence_token, which
			#	is what is used to determine the logged in user.
			#	We need to update the session to use this new token
			#	otherwise the user will effectively be logged out here.
			#
			current_user_session.send(:update_session)
			flash[:notice] = "Password successfully updated."
#			redirect_to rails_user_path(current_user)
			redirect_to root_path
		end
	rescue ActiveRecord::RecordInvalid
		flash.now[:error] = "Password update failed."
		render :action => 'edit'
	end

protected

	def validate_current_password
		access_denied("Old password is not valid",edit_password_path) unless
			current_user.valid_password?(params[:rails_user].delete('current_password'))
	end

	def rails_user_params
		params.require(:rails_user).permit(:current_password, :password, :password_confirmation)
	end

end
