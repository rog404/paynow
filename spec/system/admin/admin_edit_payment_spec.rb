require 'rails_helper'

describe 'Admin edit payment' do
        it 'successfully' do
            admin_login
            Payment.create(description: 'Roxinho', fee: 2.2, max_money_fee: 10.0, payment_type: :pix)
            
            visit root_path
            click_on 'Modelos de Pagamento'
            click_on 'Configurar'

            fill_in 'Descrição do Método de Pagamento', with: 'Pix Roxinho'
            fill_in 'Taxa', with: '3.5'
            fill_in 'Taxa Máxima em Reais', with: '13.50'
            check 'check'
            click_on 'Atualizar Modelo de Pagamento'

            expect(page).to have_content('Modelo atualizado com sucesso')
            expect(page).to have_content('PIX')
            expect(page).to have_content('Pix Roxinho')
            expect(page).to have_content('3,5')
            expect(page).to have_content('13,50')
            expect(page).to have_content('Ativo')
            
        end

        it 'and cannot be blank' do
            admin_login
            Payment.create(description: 'Roxinho', fee: 2.2, max_money_fee: 10.0, payment_type: :pix)
        
            visit root_path
            click_on 'Modelos de Pagamento'
            click_on 'Configurar'
            fill_in 'Descrição do Método de Pagamento', with: ''
            click_on 'Atualizar Modelo de Pagamento'

            expect(page).to have_content('não pode ficar em branco')
            
        end
end