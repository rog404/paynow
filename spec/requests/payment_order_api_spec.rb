require 'rails_helper'

describe 'Order API' do
    context 'GET /api/v1/payment_orders/:token' do
        it 'should get all payment orders' do
            pix_payment = Payment.create!(description: 'Pix :D', fee: 0.2, max_money_fee: 5, payment_type: :pix)
            company = Company.create!(cnpj: '28348439000129', name: 'CAMPUS CODE SERVICOS E CONSULTORIA DE INFORMATICA LTDA', email: 'contato@campuscode.com.br', address: 'Alameda Santos, 1293. Jardim paulista, São Paulo - SP')
            Pix.create!(payment: pix_payment, key: '12hjk12312j3h', bank_code: '132', company: company)
            payment_method = PaymentMethod.first
            product = Product.create!(name: 'Curso TreinaDev', price: 1250, discount_pix: 10, discount_boleto: 10, discount_credit_card: 2, company: company)
            client = Client.create!(name: 'Rogerio Bordignon', cpf: '01730967214')
            order = PaymentOrder.create!(company_token: company.token, payment_method_token: payment_method.token,
                product_token: product.token, client_token: client.token)

            get "/api/v1/payment_orders/#{order.token}"
            
            expect(response).to have_http_status(200)
            expect(response.content_type).to include('application/json')
            parsed_body = JSON.parse(response.body)
            expect(response.body).to include(order.token)
            expect(response.body).to include(order.company_token)
            expect(response.body).to include(order.client_token)
        end
    end

    context 'POST /api/v1/payment_orders' do
        it 'create a payment order successfully' do
            pix_payment = Payment.create!(description: 'Pix :D', fee: 0.2, max_money_fee: 5, payment_type: :pix)
            company = Company.create!(cnpj: '28348439000129', name: 'CAMPUS CODE SERVICOS E CONSULTORIA DE INFORMATICA LTDA', email: 'contato@campuscode.com.br', address: 'Alameda Santos, 1293. Jardim paulista, São Paulo - SP')
            Pix.create!(payment: pix_payment, key: '12hjk12312j3h', bank_code: '132', company: company)
            payment_method = PaymentMethod.first
            product = Product.create!(name: 'Curso TreinaDev', price: 1250, discount_pix: 10, discount_boleto: 10, discount_credit_card: 2, company: company)
            client = Client.create!(name: 'Rogerio Bordignon', cpf: '01730967214')
            
            post '/api/v1/payment_orders', params: {
                payment_order: {
                    company_token: company.token,
                    payment_method_token: payment_method.token,
                    product_token: product.token,
                    client_token: client.token
                }
            }

            expect(response).to have_http_status(201)
            expect(response.content_type).to include('application/json')
            parsed_body = JSON.parse(response.body)
            expect(parsed_body['token']).to eq(PaymentOrder.first.token)
        end
        it 'should not create a order with invalid params' do
            
            post '/api/v1/payment_orders', params: {
                payment_order: {number: 12}
            }

            expect(response).to have_http_status(422)
            expect(response.content_type).to include('application/json')
            parsed_body = JSON.parse(response.body)
        end
        it 'should not create non correct params model' do
            
            post '/api/v1/payment_orders', params: {
                
            }

            expect(response).to have_http_status(412)
            expect(response.content_type).to include('application/json')
            parsed_body = JSON.parse(response.body)
        end
    end
end