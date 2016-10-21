class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	def valid_find_page
		#	0 is apparently bad.
		( !params[:page].blank? && ( params[:page].to_i > 0 ) ) ? params[:page] : 1
	end

end
