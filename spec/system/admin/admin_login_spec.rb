require 'rails_helper'

describe 'Admin Log' do
    it 'successfully' do
        user = User.create!(name: 'Rogerio', email: 'rogerio@paynow.com.br', password: '123456')

        visit root_path
        click_on 'Entrar'
        fill_in 'Email', with: 'rogerio@paynow.com.br'
        fill_in 'Senha', with: '123456'
        within 'form' do
            click_on 'Entrar'
        end

        expect(page).to have_content('Login efetuado com sucesso!')
        expect(page).to have_link('Empresas')
        expect(page).to have_link('Modelos de Pagamento')
        expect(page).to have_link('Pagamentos Pendentes')
        expect(page).to have_link('Usuários')
        expect(page).to_not have_link('Registrar')
        expect(page).to_not have_link('Entrar')
        expect(page).to have_selector(:css, "svg#i-signout")
    end
end