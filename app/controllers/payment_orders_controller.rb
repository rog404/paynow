class PaymentOrdersController < ApplicationController
    before_action :set_orders, only: %i[index]

    def index
        
    end

    def new
        @order = PaymentOrder.new
    end


    def approve
        @order.approved!
        if @company.save
            redirect_to @payment_order, notice: t('.success')
        else
            render :new, notice: t('.error')
        end
    end

    private
    def set_order
        @payment_orders = PaymentOrder.find params[:id]        
    end

    def set_orders
        @payment_orders = PaymentOrder.where status: :pending
    end

    def order_params
        #params.require(:client).permit(:name, :cpf)
    end

end