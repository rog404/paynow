require 'rails_helper'

describe 'Admin add payment method in company' do
    context 'as PIX' do
        it 'successfully' do
            Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA',
                            email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')
            payment = Payment.create!(description: 'PIX', fee: 0.7, max_money_fee: 7.90, payment_type: :pix)
            Payment.create!(description: 'PIX Promoção', fee: 0.2, max_money_fee: 5.90, payment_type: :pix)
            Payment.create!(description: 'PIX Desativo', fee: 1.7, max_money_fee: 17.90, payment_type: :pix, state: :disabled)

            visit root_path
            click_on 'Empresas'
            click_on 'Codeplay cursos online LTDA'
            click_on 'Adicionar'
            click_on 'PIX'
            select "#{payment.description} - taxa: #{payment.fee}% até: R$ #{payment.max_money_fee}", from: 'Modelo de Pagamento'
            fill_in 'Código do Banco', with: '103'
            fill_in 'Chave PIX', with: '12HqwH12Hds1321'
            click_on 'Adicionar PIX'
            
            expect(page).to have_content('Método adicionado com sucesso')
            expect(page).to have_content('PIX')
            expect(page).to have_content('7,90')
        end
    end
    context 'as Boleto' do
        it 'successfully' do
            Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA',
                            email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')
            payment = Payment.create!(description: 'Boleto', fee: 0.7, max_money_fee: 7.90, payment_type: :boleto)
            Payment.create!(description: 'Boleto Errado Promoção', fee: 0.2, max_money_fee: 5.90, payment_type: :boleto)
            Payment.create!(description: 'Boleto Desativo', fee: 1.7, max_money_fee: 17.90, payment_type: :boleto, state: :disabled)
                
            visit root_path
            click_on 'Empresas'
            click_on 'Codeplay cursos online LTDA'
            click_on 'Adicionar'
            click_on 'Boleto'
            select "#{payment.description} - taxa: #{payment.fee}% até: R$ #{payment.max_money_fee}", from: 'Modelo de Pagamento'
            fill_in 'Código do Banco', with: '103'
            fill_in 'Agencia', with: '31054'
            fill_in 'Conta Corrente', with: '213132'
            click_on 'Adicionar Boleto'
            
            expect(page).to have_content('Método adicionado com sucesso')
            expect(page).to have_content('Boleto')
            expect(page).to have_content('7,90')
        end
    end
    context 'as Credit Card' do
        it 'successfully' do
            Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA',
                            email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')
            payment = Payment.create!(description: 'Cartão Roxo', fee: 0.7, max_money_fee: 7.90, payment_type: :credit_card)
            Payment.create!(description: 'Cartão Errado Promoção', fee: 0.2, max_money_fee: 5.90, payment_type: :credit_card)
            Payment.create!(description: 'Cartão Desativo', fee: 1.7, max_money_fee: 17.90, payment_type: :credit_card, state: :disabled)
                
            visit root_path
            click_on 'Empresas'
            click_on 'Codeplay cursos online LTDA'
            click_on 'Adicionar'
            click_on 'Cartão de Crédito'
            select "#{payment.description} - taxa: #{payment.fee}% até: R$ #{payment.max_money_fee}", from: 'Modelo de Pagamento'
            fill_in 'Código', with: '103'
            click_on 'Adicionar Cartão'
            
            expect(page).to have_content('Método adicionado com sucesso')
            expect(page).to have_content('Cartão de Crédito')
            expect(page).to have_content('7,90')
        end
    end  
end
