class SessionsController < ApplicationController

	def create
		user = User.find_by(email: params[:email])

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to root_url, notice: 'Welcome!'
		else
			redirect_to root_url, notice: 'Wrong email or password'
		end
	end

	def destroy
		session[:user_id] = nil
  	redirect_to root_url, notice: 'Logged out!'
	end
end