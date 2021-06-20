class Client < ApplicationRecord
    has_many :company_clients
    has_many :companies, through: :company_clients

    validates :name, :cpf, presence: true
    validates :cpf, :token, uniqueness: true

    before_save :default_values
    
    private
    def default_values
        self.token = generate_token
    end
    def generate_token
        loop do
            token = SecureRandom.base58(20)
            break token unless Client.where(token: token).exists?
        end
    end
end

