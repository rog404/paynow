require 'rails_helper'

describe 'Admin view company' do
    it 'successfully' do
        Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA', email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')
        Company.create!(cnpj: '37933546000105', name: 'Udemy cursos online S/A', email: 'faturamento@udemy.com', address: 'R. Maceio, 429, Recife - PE')
        Company.create!(cnpj: '11182263000185', name: 'Coursera online LTDA', email: 'faturamento@coursera.com', address: 'Av. 7 de Setembro, 49, Porto Velho - RO')

        visit root_path
        click_on 'Empresas'

        expect(page).to have_content('Codeplay cursos online LTDA')
        expect(page).to have_content('faturamento@codeplay.com.br')
        expect(page).to have_content('Udemy cursos online S/A')
        expect(page).to have_content('Coursera online LTDA')
    end

    it 'and view details' do
        Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA', email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')

        visit root_path
        click_on 'Empresas'
        click_on 'Codeplay cursos online LTDA'

        expect(page).to have_content('Codeplay cursos online LTDA')
        expect(page).to have_content('faturamento@codeplay.com.br')
        expect(page).to have_content('Av. Dutra, 4563, São Paulo - SP')
    end

    it 'and no company is available' do
        visit root_path
        click_on 'Empresas'
    
        expect(page).to have_content('Nenhuma empresa cadastrada')
      end
end

