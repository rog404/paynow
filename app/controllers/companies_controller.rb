class CompaniesController < ApplicationController
    before_action :set_company, only: %i[show edit update retoken]

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

    def edit
    end

    def update
        @company.update(company_params)
        redirect_to @company, notice: t('.success')
    end

    def retoken
        @company.send(:generate_token)
        if @company.save
            redirect_to @company, notice: t('.success')
        else
            render :new, notice: t('.error')
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