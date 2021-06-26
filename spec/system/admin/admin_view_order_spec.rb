require 'rails_helper'

describe 'Admin view order' do
    it 'successfully' do
        company = Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA',
            email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')
        payment = Payment.create!(description: 'PIX', fee: 0.7, max_money_fee: 7.90, payment_type: :pix)
        product = Product.create!(company: company, name: 'Curso Rails', price: 99.90, discount_pix: 10.0, discount_boleto: 10.0, discount_credit_card: 2.5)
        client =  Client.create!(cpf: '01770967214', name: 'Rogerio Bordignon')
        Pix.create!(company: company, payment: payment, key: 'K3yp1X', bank_code: '103')
        payment_method = PaymentMethod.first
        order = PaymentOrder.create!(company_token: company.token,
            payment_method_token: payment_method.token,
            product_token: product.token, client_token: client.token)
        
        admin_login
        visit root_path
        click_on 'Pagamentos Pendentes'
        
        expect(page).to have_content('Curso Rails')
    end
    it 'and approves order' do
        company = Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA',
            email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')
        payment = Payment.create!(description: 'PIX', fee: 0.7, max_money_fee: 7.90, payment_type: :pix)
        product = Product.create!(company: company, name: 'Curso Rails', price: 99.90, discount_pix: 10.0, discount_boleto: 10.0, discount_credit_card: 2.5)
        client =  Client.create!(cpf: '01770967214', name: 'Rogerio Bordignon')
        Pix.create!(company: company, payment: payment, key: 'K3yp1X', bank_code: '103')
        payment_method = PaymentMethod.first
        order = PaymentOrder.create!(company_token: company.token,
            payment_method_token: payment_method.token,
            product_token: product.token, client_token: client.token)
        
        admin_login
        visit root_path
        click_on 'Pagamentos Pendentes'
        click_on 'Aprovar'

        expect(page).to have_content('Pagamento Aprovado.')
        expect(page).to_not have_content('Curso Rails')
    end

    it 'must be looged in' do
        visit payment_orders_path
        
        expect(current_path).to eq(new_user_session_path)
    end
    
    it 'and no order is available' do
        admin_login
        visit root_path
        click_on 'Pagamentos Pendentes'
    
        expect(page).to have_content('Nenhum pagamento pendente')
      end
end
