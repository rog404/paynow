class PaymentMethodsController < ApplicationController
    before_action :set_payment_method, only: %i[show edit update]
    before_action :set_company, only: %i[method_chosen new create]

    def method_chosen
    end

    def index
        @payment_methods = PaymentMethod.all
    end

    def new
        @type = params[:type]
        @payment_method = PaymentMethod.new
    end

    def create
        
    end

    private
    def set_payment_method
        @payment_methods = PaymentMethod.find params[:id]
    end

    def set_company
        @company = Company.find params[:company_id]
    end
end