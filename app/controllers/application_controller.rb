class ApplicationController < ActionController::Base
	before_action :authorized?

	def logged_in_user?
			@current_user = User.find_by(id: session[:user_id])
	end

	def authorized?
		flash[:not_authorized] = "You need to be logged in to see that feature." 
		redirect_to users_path unless logged_in_user?
	end 
end
