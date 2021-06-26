class AutenticationController < ApplicationController
    before_action :authenticate_user!

    def user_admin
        redirect_to root_path unless current_user.admin?        
    end
end
