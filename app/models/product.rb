class Product < ApplicationRecord
  belongs_to :company

  validates :name, :price, presence: true
  validates :price, :discount_pix, :discount_boleto, :discount_credit_card, numericality: {greater_than_or_equal_to: 0}

  before_save :default_values

  private
    def default_values
        self.discount_pix ||= 0.0
        self.discount_boleto ||= 0.0
        self.discount_credit_card ||= 0.0
        self.token = generate_token
    end
    def generate_token
        loop do
            token = SecureRandom.base58(20)
            break token unless Company.where(token: token).exists?
        end
    end

  
end
