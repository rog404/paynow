require 'rails_helper'

describe 'Admin creates product' do
    it 'successfully' do
        company = Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA',
                        email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')
        payment = Payment.create!(description: 'PIX', fee: 0.7, max_money_fee: 7.90, payment_type: :pix)
        payment2 = Payment.create!(description: 'Boleto', fee: 0.7, max_money_fee: 7.90, payment_type: :boleto)
        payment3 = Payment.create!(description: 'Cartão de Crédito', fee: 0.7, max_money_fee: 7.90, payment_type: :credit_card)
        Pix.create!(company: company, payment: payment, key: 'h123uhH12', bank_code: '103')
        Boleto.create!(company: company, payment: payment2, bank_agency: '12356', bank_account: '3125042', bank_code: '103')
        CreditCard.create!(company: company, payment: payment3, code: 'h123uhH12')
        
        visit root_path
        click_on 'Empresas'
        click_on 'Codeplay cursos online LTDA'
        click_on 'Produtos'
        click_on 'Novo Produto'

        fill_in 'Nome', with: 'Curso Rails'
        fill_in 'Preço', with: '99.90'
        fill_in 'Desconto do PIX', with: '10.0'
        fill_in 'Desconto do Boleto', with: '10.0'
        fill_in 'Desconto do Credit Card', with: '2.5'
        click_on 'Criar Produto'

        expect(page).to have_content('Cuso Rails')
        expect(page).to have_content('99,90')
    end
end