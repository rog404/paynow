class PaymentOrdersController < AutenticationController
    before_action :set_orders, only: %i[index]
    before_action :set_payment_order, only: %i[approve]
    before_action :user_admin, only: %i[index]
    skip_before_action :authenticate_user!, only: %i[show]
    
    def index
    end

    def show
        @payment_order = PaymentOrder.find_by(token: params[:payment_order][:token])
        if @payment_order == nil
            redirect_to root_path, alert: 'Recibo não encontrado'
        end
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