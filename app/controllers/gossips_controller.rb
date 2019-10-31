class GossipsController < ApplicationController

    def index 
        @gossip = Gossip.all 
    end

    def show
        @gossip = Gossip.find(params[:id])
    end

    def new
        
    end
    
    def create
        @user = User.new(user_name: params[:user_name])
            @user.save
                @gossip = Gossip.new(user_id: @user.id , content: params[:content])
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
