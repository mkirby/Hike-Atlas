class UsersController < ApplicationController
		before_action :find_user, only: [:show, :edit, :update]
		skip_before_action :authorized?, only: [:new, :create]

    def show
        #users account page
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to edit_user_path(@user)
        end
    end

    private

    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:email, :email_confirmation, :password, :password_confirmation, :phone, :first_name, :last_name, :e_contact_name, :e_contact_email, :e_contact_phone)
    end
end
