class SessionsController < ApplicationController

skip_before_action :only_signed_in, only : [:new, :create]

def new 

end

def create
    user_params = params.require(:user)
    @user = User.where(user_name: user_params[:user_name]).or(User.where(email: user_params[:user_name])).first
    if @user and @user.authenticate(user_params[:password]) where(confirmed: true)

    else 
        redirect_to new_session_path, danger: 'Wrong Wrong Wrong !'
        
    end
end

end
