class CompaniesController < ApplicationController
    before_action :set_company, only: %i[show]

    def index
        @companies = Company.all
    end 
   
    def show
    end

    def new
        @company = Company.new
    end

    def create
        @company = Company.new company_params
        if @company.save
            redirect_to companies_path, notice: t('.success')
        else
            render :new
        end
    end
    
    private
    def set_company
        @company = Company.find params[:id]
    end

    def company_params
        params.require(:company).permit(:cnpj, :name, :email, :address, :state)
    end
end