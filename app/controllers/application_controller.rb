class ApplicationController < ActionController::Base

    include SessionsHelper

    before_action :only_signed_in

    def only_signed_in
        if logged_in?
            redirect_to "/sessions/new", danger: "Vous n'avez pas le droit d'acceder a cette page sans etre connecte"
        end
    end


add_flash_types :success, :danger
end
