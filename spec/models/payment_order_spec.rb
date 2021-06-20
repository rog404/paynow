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

    it 'and token must be uniq' do
      client = Client.create!(name: 'Marcio', cpf: '01770967214')
      company = Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA', email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')
      payment = Payment.create!(description: 'Pix Verde', payment_type: 'pix', fee: 3.5, max_money_fee: 13.50)
      payment_method = Pix.create!(company: company, payment: payment, key: 'H12huI3hW1', bank_code: 103)
      product = Product.create!(company: company, name: 'Curso Rails', price: '200', discount_pix: 10, discount_boleto: 10, discount_credit_card: 5)
      payment_order_old = PaymentOrder.create!(company_token: company.token, payment_method_token: payment_method.token,
                      product_token: product.token, client_token: client.token, value: product.price, discount_value: product.discount_pix)
      payment_order = PaymentOrder.new(token: payment_order_old.token, company_token: company.token, payment_method_token: payment_method.token,
                      product_token: product.token, client_token: client.token, value: product.price, discount_value: product.discount_pix)  
      payment_order.valid?

      expect(payment_order.errors[:token]).to include('já está em uso')
    end
  end
end