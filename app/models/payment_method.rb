class PaymentMethod < ApplicationRecord
    belongs_to :payment
    belongs_to :company

    validates :company, :payment, presence: true
    validates :token, uniqueness: true

    before_save :default_values 
    
    private
    def default_values
        self.token = generate_token
    end
    def generate_token
        loop do
            token = SecureRandom.base58(20)
            break token unless PaymentMethod.where(token: token).exists?
        end
    end
end

