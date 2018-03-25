class ApplicationController < ActionController::Base

  private

	def logged_in?
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def get_user_name
		@current_user.name unless @current_user.nil?
	end

	def verify_authentication
		redirect_to root_url, notice: "You are not logged in" unless logged_in?
	end

	helper_method :logged_in?
	helper_method :get_user_name
end
