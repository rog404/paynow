class ClientsController < ApplicationController
    before_action :set_company, only: %i[index show create]
    before_action :set_client, only: %i[show]

    def index
        @clients = @company.clients
    end

    def new
        @client = Client.new
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

    def set_client
        @product = @company.products.find params[:id]        
    end

    def client_params
        params.require(:client).permit(:name, :cpf)
    end
end