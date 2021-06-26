class PaymentsController < AutenticationController
    before_action :set_payment, only: %i[show edit update]
    before_action :user_admin, only: %i[index, new, create, edit, update]

    def index
        @payments = Payment.order(state: :desc)
    end

    def new
        @payment = Payment.new
    end

    def create
        @payment = Payment.new payment_params
        if @payment.save
            redirect_to payments_path, notice: t('.success')
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @payment.update(payment_params)
            redirect_to payments_path, notice: t('.success')
        else
            render :new
        end
    end

    private
    def set_payment
        @payment = Payment.find params[:id]
    end

    def payment_params
        params.require(:payment).permit(:fee, :max_money_fee, :description, :payment_type, :state)
    end

end