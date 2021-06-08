require 'rails_helper'

describe 'Admin register payment' do
    context 'as PIX' do
        it 'as successfully' do
            Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA',
                            email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')
            
            visit root_path
            click_on 'Empresas'
            ckick_on 'Codeplay cursos online LTDA'
            click_on 'Métodos de Pagamento'
            click_on 'Adicionar novo método'
            click_on 'PIX'

            fill_in 'Código do Banco', with: '101'
            fill_in 'Código PIX', with: '01234567890123456789'
            click_on 'Cadastrar novo método'

            expect(page).to have_content('101')
            expect(page).to have_content('01234567890123456789')
            
        end

        it 'and cannot be blank' do
            visit root_path
            click_on 'Empresas'
            ckick_on 'Codeplay cursos online LTDA'
            click_on 'Métodos de Pagamento'
            click_on 'Adicionar novo método'
            click_on 'PIX'

            click_on 'Cadastrar novo método'

            expect(page).to have_content('é obrigatorio(a)')
            
        end
    end

    xcontext 'as Credit Card' do
        it 'as successfully' do
        
        end

        it 'and cannot be blank' do
            
        end
    end

    xcontext 'as Boleto' do
        it 'as successfully' do
        
        end

        it 'and cannot be blank' do
            
        end
    end
end