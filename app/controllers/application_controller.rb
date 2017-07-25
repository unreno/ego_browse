class ApplicationController < ActionController::Base
	before_action :require_user
	before_action :require_user_can_create, only: [:new, :create]
	before_action :require_user_can_read, only: [:show, :index]
	before_action :require_user_can_update, only: [:edit, :update]
	before_action :require_user_can_destroy, only: [:destroy]
	protect_from_forgery with: :exception

	helper_method :current_user_session, :current_user,
		:current_user_session, :current_user
#	filter_parameter_logging :password, :password_confirmation

	def valid_find_page
		#	0 is apparently bad.
		( !params[:page].blank? && ( params[:page].to_i > 0 ) ) ? params[:page] : 1
	end

	private

		def current_user_session
			return @current_user_session if defined?(@current_user_session)
			@current_user_session = RailsUserSession.find
		end

		def current_user
			return @current_user if defined?(@current_user)
			@current_user = current_user_session && current_user_session.rails_user
		end

		def require_user
			unless current_user
				store_location
				flash[:warn] = "You must be logged in to access this page"
				redirect_to new_rails_user_session_url
				return false
			end
		end

		def require_user_can_create
			unless current_user.can_create?
				flash[:warn] = "Sorry, but you do not have permission to create."
				redirect_to root_url
				return false
			end
		end

		def require_user_can_read
			unless current_user.can_read?
				flash[:warn] = "Sorry, but you do not have permission to read."
				redirect_to root_url
				return false
			end
		end

		def require_user_can_update
			unless current_user.can_update?
				flash[:warn] = "Sorry, but you do not have permission to update."
				redirect_to root_url
				return false
			end
		end

		def require_user_can_destroy
			unless current_user.can_destroy?
				flash[:warn] = "Sorry, but you do not have permission to destroy."
				redirect_to root_url
				return false
			end
		end

		def require_no_user
			if current_user
				store_location
				flash[:notice] = "You must be logged out to access this page"
				redirect_to root_url	#	new_rails_user_session_url
				return false
			end
		end

		def require_user_is_admin_if_csv
			if params[:format] == 'csv' and !current_user.is_admin?
				flash[:warn] = "You must be logged in as an admin to download CSVs."
				redirect_to root_url
				return false
			end
		end

		def require_admin
			unless current_user.present? and current_user.is_admin?
				store_location
				flash[:warn] = "You must be logged in as an admin to do that."
				redirect_to root_url
				return false
			end
		end

#		def require_creator
#			unless current_user.present? and current_user.can_create?
#				store_location
#				flash[:warn] = "You must be logged in as a creator to do that."
#				redirect_to root_url
#				return false
#			end
#		end
#
#		def require_destroyer
#			unless current_user.present? and current_user.can_destroy?
#				store_location
#				flash[:warn] = "You must be logged in as a destroyer to do that."
#				redirect_to root_url
#				return false
#			end
#		end

		def store_location
			session[:return_to] = request.url
		end

		def redirect_back_or_default(default)
			redirect_to(session[:return_to] || default)
			session[:return_to] = nil
		end

		#	Flash error message and redirect
		def access_denied(
				message="You don't have permission to complete that action.",
				default=root_path )
			session[:return_to] = request.url unless params[:format] == 'js'
			flash[:error] = message
			redirect_to default
		end


#	Recommended by authlogic. How to test?

	protected

	def handle_unverified_request
#		# raise an exception
#		fail ActionController::InvalidAuthenticityToken
		# or destroy session, redirect
		if current_user_session
			current_user_session.destroy
		end
		redirect_to root_url
	end

end
