class ApplicationController < ActionController::Base
	before_action :require_user
	protect_from_forgery with: :exception

	helper_method :current_rails_user_session, :current_rails_user
#	filter_parameter_logging :password, :password_confirmation

	def valid_find_page
		#	0 is apparently bad.
		( !params[:page].blank? && ( params[:page].to_i > 0 ) ) ? params[:page] : 1
	end

	private

		def current_rails_user_session
			return @current_rails_user_session if defined?(@current_rails_user_session)
			@current_rails_user_session = RailsUserSession.find
		end

		def current_rails_user
			return @current_rails_user if defined?(@current_rails_user)
			@current_rails_user = current_rails_user_session && current_rails_user_session.rails_user
		end

		def require_user
			unless current_rails_user
				store_location
				flash[:warn] = "You must be logged in to access this page"
				redirect_to new_rails_user_session_url
				return false
			end
		end

		def require_no_user
			if current_rails_user
				store_location
				flash[:notice] = "You must be logged out to access this page"
				redirect_to root_url	#	new_rails_user_session_url
				return false
			end
		end

		def require_admin
			unless current_rails_user.present? and current_rails_user.is_admin?
				store_location
				flash[:warn] = "You must be logged in as an admin to do that."
				redirect_to root_url
				return false
			end
		end

		def require_creator
			unless current_rails_user.present? and current_rails_user.can_create?
				store_location
				flash[:warn] = "You must be logged in as a creator to do that."
				redirect_to root_url
				return false
			end
		end

		def require_destroyer
			unless current_rails_user.present? and current_rails_user.can_destroy?
				store_location
				flash[:warn] = "You must be logged in as a destroyer to do that."
				redirect_to root_url
				return false
			end
		end

		def store_location
			session[:return_to] = request.url
		end

		def redirect_back_or_default(default)
			redirect_to(session[:return_to] || default)
			session[:return_to] = nil
		end

#	protected
#
#	def handle_unverified_request
#		# raise an exception
#		fail ActionController::InvalidAuthenticityToken
#		# or destroy session, redirect
#		if current_rails_user_session
#			current_rails_user_session.destroy
#		end
#		redirect_to root_url
#	end

end
