class SessionsController < ApplicationController
	
  def new_login
    #defaulting to render sessions#new_login which doesn't exist

	end 

	def login 
    # find user 
    @user = User.find_by(email: params[:session][:email])

    #compare passwords
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id 
      redirect_to users_path
    else 
      flash[:error] = "Password or Email did not match"
      redirect_to new_login_path
    end 
	end 
	
	def logout 
    session.delete(:user_id)
    redirect_back fallback_location: users_path
  end 
end