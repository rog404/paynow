require 'rails_helper'

describe 'Admin view products' do
    it 'successfully' do
        user = User.create!(name: 'Rogerio', email: 'rogerio@paynow.com.br', password: '123456')
        login_as user
        company = Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA',
                                  email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')
        client = Client.create!(cpf: '01770967214', name: 'Rogerio Bordignon')
        CompanyClient.create!(company: company, client: client)
        
        visit root_path
        click_on 'Empresas'
        click_on 'Codeplay cursos online LTDA'
        click_on 'Clientes'

        expect(page).to have_content('Rogerio Bordignon')
        expect(page).to have_content('01770967214')
    end
    it 'and show empty msg' do
        user = User.create!(name: 'Rogerio', email: 'rogerio@paynow.com.br', password: '123456')
        login_as user
        company = Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA',
                                  email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')
        
        visit root_path
        click_on 'Empresas'
        click_on 'Codeplay cursos online LTDA'
        click_on 'Clientes'

        expect(page).to have_content('Nenhum cliente cadastrado')
    end

    it 'must be looged in' do
        visit company_clients_path
        
        expect(current_path).to eq(new_user_session_path)
    end
end