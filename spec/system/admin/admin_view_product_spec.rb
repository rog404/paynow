require 'rails_helper'

describe 'Admin view products' do
    it 'successfully' do
        admin_login
        company = Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA',
                        email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')
        payment = Payment.create!(description: 'PIX', fee: 0.7, max_money_fee: 7.90, payment_type: :pix)
        payment2 = Payment.create!(description: 'Boleto', fee: 0.7, max_money_fee: 7.90, payment_type: :boleto)
        payment3 = Payment.create!(description: 'Cartão de Crédito', fee: 0.7, max_money_fee: 7.90, payment_type: :credit_card)
        Pix.create!(company: company, payment: payment, key: 'h123uhH12', bank_code: '103')
        Boleto.create!(company: company, payment: payment2, bank_agency: '12356', bank_account: '3125042', bank_code: '103')
        CreditCard.create!(company: company, payment: payment3, code: 'h123uhH12')
        Product.create!(company: company, name: 'Curso Rails', price: 99.90, discount_pix: 10.0, discount_boleto: 10.0, discount_credit_card: 2.5)
        
        visit root_path
        click_on 'Empresas'
        click_on 'Codeplay cursos online LTDA'
        click_on 'Produtos'

        expect(page).to have_content('Curso Rails')
        expect(page).to have_content('99,90')
    end
    it 'and show empty msg' do
        admin_login
        company = Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA',
                                  email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')
        
        visit root_path
        click_on 'Empresas'
        click_on 'Codeplay cursos online LTDA'
        click_on 'Produtos'

        expect(page).to have_content('Nenhum produto cadastrado')
    end
end