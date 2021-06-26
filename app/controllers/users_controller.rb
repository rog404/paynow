class UsersController < AutenticationController
    before_action :set_user, only: %i[show]

    def index
        if current_user.admin?
            @users = User.all
        else
            @users = User.where(company: current_user.company)
        end
    end

    def create
        @user = 
    end

    private


    def set_user
        @user = @company.products.find params[:id]        
    end

end