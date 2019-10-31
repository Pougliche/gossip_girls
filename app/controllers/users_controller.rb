class UsersController < ApplicationController

def index
    @user = User.all
end

def show
    @user = User.find(params[:id])
end

def new
    
end

def create
    @user = User.new
    @user.password = params[:password_digest]
    @user.email = params[:email]
    @user.user_name = params[:user_name]
    @user.save
    if @user.save
        redirect_to gossips_path
    else
        render :new
    end
    
end

end
