class GossipsController < ApplicationController

    before_action :set_gossip, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user, only: [:edit, :update, :destroy]


    def index 
        @gossip = Gossip.all 
    end

    def show
        @gossip = Gossip.find(params[:id])
    end

    def new
        @gossip = Gossip.new
    end
    
    def create
                
        @gossip = Gossip.new(gossip_params)
        @gossip.user = User.find_by(id: current_user.id)

        if @gossip.save
            redirect_to gossips_path
        else
            render :new
        end
    end

    
    def edit
        @gossip = Gossip.find(params[:id])
    end
    
    def update
        @gossip = Gossip.find(params[:id])
            gossip_params = params.require(:gossip).permit(:body, :content)
                @gossip.update(gossip_params)
                    redirect_to gossips_path
    end
    
    def destroy
        @gossip = Gossip.find(params[:id])
            @gossip.destroy
                redirect_to gossips_path
    end


    end

    private

	def gossip_params
		return params.require(:gossip).permit(:content)
    end
    
    def set_gossip
        @gossip = Gossip.find(params[:id])
    end

    def authenticate_user
		unless current_user.id == @gossip.user.id
		  flash[:danger] = "Restricted Area"
		  redirect_to gossips_path
		end
	end


