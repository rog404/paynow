class Company < ApplicationRecord
    has_many :payment_methods
    has_many :products

    validates :name, :cnpj, :email, :address, presence: true
    validates :cnpj, :token, uniqueness: true

    enum state: [:disabled, :active]

    before_save :default_values 
    
    private
    def default_values
        self.state ||= :active
        self.token = generate_token
    end
    def generate_token
        loop do
            token = SecureRandom.base58(20)
            break token unless Company.where(token: token).exists?
        end
    end
end
