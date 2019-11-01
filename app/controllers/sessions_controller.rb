class SessionsController < ApplicationController

    skip_before_action :only_signed_in, only: [:new, :create]

def new 

end

def create
    user_params = params.require(:user)
    @user = User.find_by(email: user_params[:email])

    if @user && @user.authenticate(user_params[:password])
        session[:user_id] = @user.id
        redirect_to gossips_path, flash: {success: "Welcome #{@user.user_name}!" }

    else 
        redirect_to new_session_path
        
    end
end

def destroy
    session.delete(:user_id)
    redirect_to gossips_path
end

def user_params
    @user = User.find(params[:id])
end

end
