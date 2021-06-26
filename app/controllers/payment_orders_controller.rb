class PaymentOrdersController < AutenticationController
    before_action :set_orders, only: %i[index]
    before_action :set_payment_order, only: %i[approve]
    before_action :user_admin, only: %i[index]

    def index
        
    end

    def new
        @order = PaymentOrder.new
    end


    def approve
        @order.approved!
        if @order.save
            redirect_to payment_orders_path, notice: t('.success')
        else
            render :new, notice: t('.error')
        end
    end

    private
    def set_payment_order
        @order = PaymentOrder.find params[:id]        
    end

    def set_orders
        @payment_orders = PaymentOrder.where status: :pending
    end

    def order_params
        #params.require(:client).permit(:name, :cpf)
    end

end