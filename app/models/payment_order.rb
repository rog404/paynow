class PaymentOrder < ApplicationRecord
    validates :company_token, :payment_method_token, :product_token, :client_token, presence: true
    validates :value, :discount_value, presence: true, numericality: {greater_than_or_equal_to: 0}
    validates :token, uniqueness: true

    enum state: [:pending, :approved]
    
    before_save :default_values
    
    private
    def default_values
        self.status ||= :pending
        self.token = generate_token
    end
    def generate_token
        loop do
            token = SecureRandom.base58(20)
            break token unless Company.where(token: token).exists?
        end
    end
end

