class ClientsController < ApplicationController
    before_action :set_company, only: %i[index show create]
    before_action :set_product, only: %i[show]

    def index
        @products = @company.products
    end

    def show
    end

    def new
        @product = Product.new
    end

    def create
        @product = @company.products.new product_params
        if @product.save
            redirect_to company_products_path(@company), notice: t('.success')
        else
            render :new
        end
    end

    private
    def set_company
        @company = Company.find params[:company_id]
    end

    def set_product
        @product = @company.products.find params[:id]        
    end

    def product_params
        params.require(:product).permit(:name, :price, :discount_pix, :discount_boleto, :discount_credit_card)
    end
end