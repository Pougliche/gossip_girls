class UsersController < ApplicationController

    skip_before_action :only_signed_in, only: [:new, :create]

    def index
    @user = User.all
    end

    def show
    @user = User.find(params[:id])
    end

    def new
    @user = User.new
    end

    def create
        user_params = params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
        @user = User.new(user_params)

        if @user.valid?
        @user.save
        redirect_to gossips_path, success: "User created!"

        else
        render :new
    
        end

    end

    private

	def user_params
		return params.require(:user).permit(:user_name, :email, :password_digest )
	end

end
