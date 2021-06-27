require 'rails_helper'

describe 'Client API' do
    context 'GET /api/v1/clients' do
        it 'should get clients' do
            company = Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA',
                                      email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')
            client = Client.create!(cpf: '01770967214', name: 'Rogerio Bordignon')
            client2 = Client.create!(cpf: '01208472813', name: 'Tiago Borges')
            CompanyClient.create!(company: company, client: client)
            CompanyClient.create!(company: company, client: client2)

            get '/api/v1/clients'

            
            expect(response).to have_http_status(200)
            expect(response.content_type).to include('application/json')
            parsed_body = JSON.parse(response.body)
            expect(parsed_body.count).to eq(Client.count)
            expect(response.body).to include('Rogerio Bordignon')
            expect(response.body).to include('Tiago Borges')
        end

        it 'returns no client' do
            get '/api/v1/clients'

            
            expect(response).to have_http_status(200)
            expect(response.content_type).to include('application/json')
            parsed_body = JSON.parse(response.body)
            expect(parsed_body).to be_empty
        end
    end
    context 'GET /api/v1/clients/token' do
        it 'should return a client' do
            company = Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA',
                email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')
            client = Client.create!(cpf: '01770967214', name: 'Rogerio Bordignon')
            client2 = Client.create!(cpf: '01208472813', name: 'Tiago Borges')
            CompanyClient.create!(company: company, client: client)
            CompanyClient.create!(company: company, client: client2)

            get "/api/v1/clients/#{client.token}"


            expect(response).to have_http_status(200)
            expect(response.content_type).to include('application/json')
            parsed_body = JSON.parse(response.body)
            expect(response.body).to include('Rogerio Bordignon')
            expect(response.body).to_not include('Tiago Borges')
        end
        it 'client not found' do
            get "/api/v1/clients/123hHU12huHU"


            expect(response).to have_http_status(404)
        end
    end
    context 'POST /api/v1/clients' do
        it 'should create a client' do
            
            post '/api/v1/clients', params: {
                client: {name: 'Rogerio Bordignon', cpf: '01770967214'}
            }

            expect(response).to have_http_status(201)
            expect(response.content_type).to include('application/json')
            parsed_body = JSON.parse(response.body)
            expect(parsed_body['name']).to eq('Rogerio Bordignon')
            expect(parsed_body['cpf']).to eq('01770967214')
        end
        it 'should not create a client with invalid params' do
            
            post '/api/v1/clients', params: {
                client: {number: 12}
            }

            expect(response).to have_http_status(422)
            expect(response.content_type).to include('application/json')
            parsed_body = JSON.parse(response.body)
            expect(parsed_body['name']).to eq(['não pode ficar em branco'])
            expect(parsed_body['cpf']).to include('não pode ficar em branco')
        end
    end
end