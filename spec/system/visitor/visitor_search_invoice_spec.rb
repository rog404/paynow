require 'rails_helper'

describe 'Visiter' do
    context 'search invoice' do
        it 'successfully' do
            pix_payment = Payment.create!(description: 'Pix :D', fee: 0.2, max_money_fee: 5, payment_type: :pix)
            company = Company.create!(cnpj: '28348439000129', name: 'CAMPUS CODE SERVICOS E CONSULTORIA DE INFORMATICA LTDA', email: 'contato@campuscode.com.br', address: 'Alameda Santos, 1293. Jardim paulista, São Paulo - SP')
            Pix.create!(payment: pix_payment, key: '12hjk12312j3h', bank_code: '132', company: company)
            payment_method = PaymentMethod.first
            product = Product.create!(name: 'Curso TreinaDev', price: 1250, discount_pix: 10, discount_boleto: 10, discount_credit_card: 2, company: company)
            client = Client.create!(name: 'Rogerio Bordignon', cpf: '01730967214')
            order = PaymentOrder.create!(company_token: company.token, payment_method_token: payment_method.token,
                product_token: product.token, client_token: client.token)
            visit root_path

            fill_in 'form', with: order.token
            click_on 'Procurar'

            expect(page).to have_content(order.token)
            expect(page).to have_content('Rogerio Bordignon')
            expect(page).to have_content('Curso TreinaDev')
        end
        it 'with wrong token' do
            visit root_path
            click_on 'Procurar'

            expect(page).to have_content('Recibo não encontrado')
        end
    end
end