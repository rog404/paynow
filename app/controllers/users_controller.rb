class UsersController < ApplicationController
    before_action :set_user, only: %i[show]

    def index
        @users = User.all
    end

    private


    def set_user
        @user = @company.products.find params[:id]        
    end
end