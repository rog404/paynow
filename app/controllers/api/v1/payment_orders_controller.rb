class Api::V1::PaymentOrdersController < ActionController::API

    def show
        @order = PaymentOrder.find_by!(token: params[:token])
        render json: @order.as_json(except: [:id, :created_at, :updated_at])
    rescue ActiveRecord::RecordNotFound
        head 404
    end

    def create
        @order = PaymentOrder.new(order_params)
        @order.save!
        render json: @order.as_json(except: [:id, :created_at, :updated_at]), status: :created
    rescue ActiveRecord::RecordInvalid
        render json: @order.errors, status: :unprocessable_entity
    rescue ActionController::ParameterMissing
        render status: :precondition_failed, json: { errors: 'parâmetros inválidos'}
    end

    private
    def order_params
        params.require(:payment_order).permit(:company_token, :payment_method_token, :product_token, :client_token)
    end
end