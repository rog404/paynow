require 'rails_helper'

describe 'Admin register payment' do
    context 'as PIX' do
        it 'as successfully' do
            visit root_path
            click_on 'Modelos de Pagamento'
            click_on 'Adicionar'

            fill_in 'Descrição do Método de Pagamento', with: 'Pix Roxinho'
            select 'PIX', from: 'Tipo de Pagamento'
            fill_in 'Taxa', with: '3.5'
            fill_in 'Taxa Máxima em Reais', with: '13.50'
            click_on 'Criar Modelo de Pagamento'

            expect(page).to have_content('Modelo adicionado com sucesso')
            expect(page).to have_content('PIX')
            expect(page).to have_content('Pix Roxinho')
            expect(page).to have_content('3,5')
            expect(page).to have_content('13,50')
            
        end

        it 'and cannot be blank' do
        
            visit root_path
            click_on 'Modelos de Pagamento'
            click_on 'Adicionar'
            click_on 'Criar Modelo de Pagamento'

            expect(page).to have_content('não pode ficar em branco')
            
        end

        it 'and fee and max money fee must be numerical' do
            visit root_path
            click_on 'Modelos de Pagamento'
            click_on 'Adicionar'

            fill_in 'Descrição do Método de Pagamento', with: 'Pix Roxinho'
            select('PIX', from: 'Tipo de Pagamento')
            fill_in 'Taxa', with: 'dasdsa'
            fill_in 'Taxa Máxima em Reais', with: 'sadas'
            click_on 'Criar Modelo de Pagamento'

            expect(page).to have_content('não é um número')
        end
    end

    context 'as Credit Card' do
        it 'as successfully' do
            visit root_path
            click_on 'Modelos de Pagamento'
            click_on 'Adicionar'

            fill_in 'Descrição do Método de Pagamento', with: 'Cartão Roxinho'
            select('Cartão de Crédito', from: 'Tipo de Pagamento')
            fill_in 'Taxa', with: '3.5'
            fill_in 'Taxa Máxima em Reais', with: '13.50'
            click_on 'Criar Modelo de Pagamento'

            expect(page).to have_content('Modelo adicionado com sucesso')
            expect(page).to have_content('Cartão de Crédito')
            expect(page).to have_content('Cartão Roxinho')
            expect(page).to have_content('3,5')
            expect(page).to have_content('13,50')
        end
    end

    context 'as Boleto' do
        it 'as successfully' do
            visit root_path
            click_on 'Modelos de Pagamento'
            click_on 'Adicionar'

            fill_in 'Descrição do Método de Pagamento', with: 'Boleto Roxinho'
            select('Boleto', from: 'Tipo de Pagamento')
            fill_in 'Taxa', with: '3.5'
            fill_in 'Taxa Máxima em Reais', with: '13.50'
            click_on 'Criar Modelo de Pagamento'

            expect(page).to have_content('Modelo adicionado com sucesso')
            expect(page).to have_content('Boleto')
            expect(page).to have_content('Boleto Roxinho')
            expect(page).to have_content('3,5')
            expect(page).to have_content('13,50')
        end
    end
end