require 'rails_helper'

describe 'ClientCompany API' do
    context 'POST /api/v1/company_clients' do
        it 'should create match between company and client' do
            company = Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA',
                        email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')
            client = Client.create!(cpf: '01770967214', name: 'Rogerio Bordignon')
            
            post '/api/v1/company_clients', params: {
                client: {name: 'Rogerio', cpf: '01770967214'},
                company_token: company.token
            }

            expect(response).to have_http_status(201)
            expect(response.content_type).to include('application/json')
            parsed_body = JSON.parse(response.body)
            expect(parsed_body['ok']).to eq('cliente adicionado a compania')
            expect(parsed_body['client_token']).to eq(client.token)
        end
        it 'create a client if it doesnt exist' do
            company = Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA',
                email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')
            
            post '/api/v1/company_clients', params: {
                client: {name: 'Rogerio', cpf: '01770967214'},
                company_token: company.token
            }
            
            expect(response).to have_http_status(201)
            expect(response.content_type).to include('application/json')
            parsed_body = JSON.parse(response.body)
            expect(parsed_body['ok']).to eq('cliente adicionado a compania')
            expect(parsed_body['client_token']).to eq(Client.last.token)
        end
        it 'should not create a client with invalid params' do
            company = Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA',
                email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')

            post '/api/v1/company_clients', params: {
                client: { number: 43 },
                company_token: company.token
            }

            expect(response).to have_http_status(422)
            expect(response.content_type).to include('application/json')
            parsed_body = JSON.parse(response.body)
            expect(parsed_body['name']).to eq(['não pode ficar em branco'])
            expect(parsed_body['cpf']).to include('não pode ficar em branco')
        end

        it 'should send a real company' do
            company = Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA',
                email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')

            post '/api/v1/company_clients', params: {
                client: {name: 'Rogerio', cpf: '01770967214'},
                company_token: 'token3RR4D0'
            }

            expect(response).to have_http_status(404)
            expect(response.content_type).to include('application/json')
            parsed_body = JSON.parse(response.body)
            expect(parsed_body['errors']).to include('compania não encontrada')
        end
        it 'has already a link company and client' do
            company = Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA',
                email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')
            client = Client.create!(cpf: '01770967214', name: 'Rogerio Bordignon')
            CompanyClient.create!(company: company, client: client)
            
            post '/api/v1/company_clients', params: {
                client: {name: 'Rogerio', cpf: '01770967214'},
                company_token: company.token
            }

            expect(response).to have_http_status(409)
            expect(response.content_type).to include('application/json')
            parsed_body = JSON.parse(response.body)
            expect(parsed_body['errors']).to include('cliente já está ligado a compania')

        end
    end
end