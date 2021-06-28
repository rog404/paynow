class PaymentOrder < ApplicationRecord
    validates :company_token, :payment_method_token, :product_token, :client_token, presence: true
    validates :token, uniqueness: true
    #validates :product_token, presence: true, if: :is_a_product_of_the_company
    #validates :payment_method_token, presence: true, if: :is_a_payment_of_the_company
    #validates :client_token, presence: true, if: :is_a_client_of_the_company

    enum status: [:pending, :approved]
    
    before_save :default_values
    before_validation :product, :company, :payment_method, :client

    
    def product
        Product.where(token: self.product_token).first
    end

    def company
        Company.where(token: self.company_token).first
    end

    def payment_method
        PaymentMethod.where(token: self.payment_method_token).first
    end

    def client
        Client.where(token: self.client_token).first
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

    def is_a_product_of_the_company
        errors.add(:product_token, "é dessa empresa") if company.id != product.company_id

    end

    def is_a_payment_of_the_company
        errors.add(:payment_method_token, "não é dessa empresa") if company.id != payment_method.company_id
    end

    def is_a_client_of_the_company
        errors.add(:client_token, "não é dessa empresa") if !client.company_ids.include?(company.id)
    end
end

