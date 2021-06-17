require 'rails_helper'

describe 'Admin create payment order' do
    it 'successfully' do
        company = Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA',
                        email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')
        Payment.create!(description: 'PIX', fee: 0.7, max_money_fee: 7.90, payment_type: :pix)
        Product.create!(company: company, name: 'Curso Rails', price: 99.90, discount_pix: 10.0, discount_boleto: 10.0, discount_credit_card: 2.5)

        
    end
end