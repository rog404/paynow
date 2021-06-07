require 'rails_helper'

describe 'Admin edit company' do
    xit 'successfully' do
        Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA', email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')

        visit root_path
        click_on 'Empresas'
        click_on 'Codeplay cursos online LTDA'
        click_on 'Editar'

        fill_in 'CNPJ', with: '87470788000130'
        fill_in 'Nome', with: 'Udemy cursos'
        fill_in 'Email', with: 'faturamento@udemy.com'
        fill_in 'Endereço', with: 'R. Salvador Dali, 2452, Palma - TO'
        select "Desativada", from: 'Status'
        click_on 'Salvar empresa'

        expect(page).to have_content('87470788000130')
        expect(page).to have_content('Udemy cursos')
        expect(page).to have_content('faturamento@udemy.com')
        expect(page).to have_content('R. Salvador Dali, 2452, Palma - TO')
        expect(page).to have_content('disabled')
    end
end