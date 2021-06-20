require 'rails_helper'

describe 'Visitor creates account' do
    context 'as Admin' do
        it 'with codeplay email and password' do
            visit root_path
            click_on 'Registrar'
            fill_in 'Email', with: 'rogerio@paynow.com.br'
            fill_in 'Nome', with: 'Rogerio [Admin]'
            fill_in 'Senha', with: '123456'
            fill_in 'Confirmação de Senha', with: '123456'
            click_on 'Criar Conta'

            expect(page).to have_text('Login efetuado com sucesso')
            expect(page).to have_text('rogerio@paynow.com.br')
            expect(current_path).to eq(root_path)
            expect(page).to_not have_link('Registrar')
            expect(page).to have_selector(:css, "svg#i-signout")
            expect(page).to have_link('Empresas')
            expect(page).to have_link('Modelos de Pagamento')
            expect(page).to have_link('Pagamentos Pendentes')
        end

        xit 'without blank field' do
            
        end

        xit 'password not match confirmation' do

            
        end

        xit 'and unique email' do
            
        end

        it 'and can logout' do
            user = User.create!(name: 'Rogerio', email: 'rogerio@paynow.com.br', password: '123456')

            login_as user
            visit root_path
            click_on 'Sair'

            expect(page).to have_text('Saiu com sucesso')
            expect(page).to have_link('Entrar')
        end
    end
    xcontext 'as Company Owner' do
        
    end
    xcontext 'as Company Employer' do
        
    end
end