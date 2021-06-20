require 'rails_helper'

describe 'Admin view orders' do
    it 'successfully' do
        client = Client.create!(name: 'Marcio', cpf: '01770967214')
        company = Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA', email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')
        company_old = Company.create!(cnpj: '81471248800321', name: 'Topper curso tap', email: 'faturamento@topper.com.br', address: 'R. Variant, 231, São Paulo - SP')
        payment = Payment.create!(description: 'Pix Verde', payment_type: 'pix', fee: 3.5, max_money_fee: 13.50)
        payment_method = Pix.create!(company: company, payment: payment, key: 'H12huI3hW1', bank_code: 103)
        product = Product.create!(company: company, name: 'Curso Rails', price: '200', discount_pix: 10, discount_boleto: 10, discount_credit_card: 5)
        order = PaymentOrder.create!(company_token: company.token, payment_method_token: payment_method.token,
                      product_token: product.token, client_token: client.token, value: product.price, discount_value: product.discount_pix)
        order_two = PaymentOrder.create!(company_token: company_old.token, payment_method_token: payment_method.token,
                        product_token: product.token, client_token: client.token, value: product.price, discount_value: product.discount_pix)

        visit root_path
        click_on 'Pagamentos Pendentes'

        expect(page).to have_content(order.token)
        expect(page).to have_content(order_two.token)

    end

    it 'and no order is available' do
        visit root_path
        click_on 'Pagamentos Pendentes'
    
        expect(page).to have_content('Nenhum pagamento pendente')
      end
end