require 'rails_helper'

describe 'Admin edit company' do
    it 'successfully' do
        Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA',
                        email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')

        visit root_path
        click_on 'Empresas'
        click_on 'Codeplay cursos online LTDA'
        click_on 'Editar'

        fill_in 'CNPJ', with: '87470788000130'
        fill_in 'Razão Social', with: 'Udemy cursos'
        fill_in 'Email', with: 'faturamento@udemy.com'
        fill_in 'Endereço', with: 'R. Salvador Dali, 2452, Palma - TO'
        uncheck 'check'
        click_on 'Salvar Empresa'

        expect(page).to have_content('Empresa atualizada com sucesso')
        expect(page).to have_content('87470788000130')
        expect(page).to have_content('Udemy cursos')
        expect(page).to have_content('faturamento@udemy.com')
        expect(page).to have_content('R. Salvador Dali, 2452, Palma - TO')
        expect(page).to have_content('Desativado')
    end

    it 'and edit token' do
        company = Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA', 
                        email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')
        old_token = company.token
        visit root_path
        click_on 'Empresas'
        click_on 'Codeplay cursos online LTDA'
        click_on 'Gerar novo Token'

        expect(page).to_not have_content(old_token)
    end
    
    it 'and not accept blank field' do
        
    end
end