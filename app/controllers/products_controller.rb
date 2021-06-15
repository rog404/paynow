class ProductsController < ApplicationController
    before_action :set_company, only: %i[index]

    def index
        @products = @company.products
    end

    private
    def set_company
        @company = Company.find params[:company_id]
    end
end