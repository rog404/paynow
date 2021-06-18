require 'rails_helper'

describe PaymentOrder do
  context 'validation' do
    it 'attributes cannot be blank' do
      payment_order = PaymentOrder.new

      payment_order.valid?

      expect(payment_order.errors[:company_token]).to include('não pode ficar em branco')
      expect(payment_order.errors[:payment_method_token]).to include('não pode ficar em branco')
      expect(payment_order.errors[:product_token]).to include('não pode ficar em branco')
      expect(payment_order.errors[:client_token]).to include('não pode ficar em branco')
    end

    xit 'token must be uniq' do
      client = Client.create!(name: 'Marcio', cpf: '01770967214')
      company = Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA', email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')
      payment = Payment.create!(description: 'Pix Verde', payment_type: 'pix', fee: 3.5, max_money_fee: 13.50)
      product = Product.create!(name: 'Curso Rails', price: '200', discount_pix: 10, discount_boleto: 10, discount_credit_card: 5)
      payment_order = PaymentOrder.new(company_token: company.token)

      payment_order.valid?

      expect(payment_order.errors[:token]).to include('já está em uso')
    end
  end
end
