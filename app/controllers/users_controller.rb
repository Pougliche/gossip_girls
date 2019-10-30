class UsersController < ApplicationController

def index
    @user = User.all
end

def show
    @user = User.all
        @gossips_user = User.find(params[:id])
end



end
