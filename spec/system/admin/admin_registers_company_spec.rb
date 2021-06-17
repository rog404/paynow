require 'rails_helper'

describe 'Admin registers company' do
    it 'successfully' do
        visit root_path
        click_on 'Empresas'
        click_on 'Adicionar'
        fill_in 'CNPJ', with: '87470788000130'
        fill_in 'Razão Social', with: 'Udemy cursos'
        fill_in 'Email', with: 'faturamento@udemy.com'
        fill_in 'Endereço', with: 'R. Salvador Dali, 2452, Palma - TO'
        check 'check'
        click_on 'Criar Empresa'

        expect(page).to have_content('Empresa adicionada com sucesso')
        expect(page).to have_content('Udemy cursos')
        expect(page).to have_content('faturamento@udemy.com')
        expect(page).to have_content('Ativo')
    end

    it 'and attributes cannot be blank' do
        visit root_path
        click_on 'Empresas'
        click_on 'Adicionar'
        click_on 'Criar Empresa'
    
        expect(page).to have_content('não pode ficar em branco', count: 4)
    end

    it 'and code must be unique' do
        Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA',
                        email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')
    
        visit root_path
        click_on 'Empresas'
        click_on 'Adicionar'
        fill_in 'CNPJ', with: '87470788000188'
        fill_in 'Razão Social', with: 'Udemy cursos'
        fill_in 'Email', with: 'faturamento@udemy.com'
        fill_in 'Endereço', with: 'R. Salvador Dali, 2452, Palma - TO'
        click_on 'Criar Empresa'
    
        expect(page).to have_content('já está em uso')
    end
    it 'email must be valid' do
        visit root_path
        click_on 'Empresas'
        click_on 'Adicionar'
        fill_in 'CNPJ', with: '87470788000130'
        fill_in 'Razão Social', with: 'Udemy cursos'
        fill_in 'Email', with: 'faturamentom'
        fill_in 'Endereço', with: 'R. Salvador Dali, 2452, Palma - TO'
        check 'check'
        click_on 'Criar Empresa'

        expect(page).to have_content('não é válido')
    end

    xit 'must be looged in to create company' do
        visit new_admin_course_path
    
        expect(current_path).to eq(new_user_session_path)
    end
      
end