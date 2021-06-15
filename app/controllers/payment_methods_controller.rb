class PaymentMethodsController < ApplicationController
    before_action :set_payment_method, only: %i[show edit update]
    before_action :set_company, only: %i[method_chosen new create]
    before_action :set_payment, only: %i[create]

    def method_chosen
    end

    def index
        @payment_methods = PaymentMethod.all
    end

    def new
        @type = params[:type]
        @payments = Payment.where(state: :active, payment_type: @type)
        @payment_method = PaymentMethod.new
    end

    def create
        @payment_type = @payment.payment_type
        if @payment_type == 'pix'
            @payment_method = new_pix
        elsif @payment_type == 'boleto'
            @payment_method = new_boleto
        else
            @payment_method = new_credit_card
        end
        if @payment_method.save
            redirect_to @company, notice: t('.success')
        else
            render :new
        end
    end

    private
    def set_payment_method
        @payment_methods = PaymentMethod.find params[:id]
    end

    def set_company
        @company = Company.find params[:company_id]
    end

    def set_payment
        @payment = Payment.find params[:payment_method][:payment]
    end

    def new_pix
        Pix.new(company: @company, payment: @payment, key: params[:payment_method][:key], bank_code: params[:payment_method][:bank_code])
    end

    def new_boleto
        Boleto.new(company: @company, payment: @payment, bank_agency: params[:payment_method][:bank_agency], bank_account: params[:payment_method][:bank_account], bank_code: params[:payment_method][:bank_code])
    end

    def new_credit_card
        CreditCard.new(company: @company, payment: @payment, code: params[:payment_method][:code])
    end
end