class PaymentOrder < ApplicationRecord
    validates :company_token, :payment_method_token, :product_token, :client_token, presence: true
    validates :value, :discount_value, numericality: {greater_than_or_equal_to: 0}
    validates :token, uniqueness: true

    enum status: [:pending, :approved]
    
    before_save :default_values
    
    def product
        Product.where(token: self.product_token).first
    end

    def company
        Company.where(token: self.company_token).first
    end

    def payment_method
        Product.where(token: self.payment_method_token).first
    end

    private
    def default_values
        self.value = product.price
        self.discount_value = calculate_discount
        self.status ||= :pending
        self.token = generate_token
    end
    def generate_token
        loop do
            token = SecureRandom.base58(20)
            break token unless PaymentOrder.where(token: token).exists?
        end
    end

    def calculate_discount
        if payment_method.type == 'Pix'
            value - (value * product.discount_pix / 100)
        elsif payment_method.type == 'Boleto'
            value - (value * product.discount_boleto / 100)
        else
            value - (value * product.discount_credit_card / 100)
        end
    end
end

