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
    @user = User.create(password_digest: params[:password_digest], email: params[:email],user_name: params[:user_name])
    if @user.save
        redirect_to gossips_path
    else
        render :new
    end
    
end

end
