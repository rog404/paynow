class Api::V1::CompanyClientsController < ActionController::API
    def create
        @company = Company.find_by!(token: params['company_token'])
        if @client = Client.find_by(cpf: params['client']['cpf'])
            if !CompanyClient.where(company: @company, client: @client).empty?
                render json: { errors: 'cliente já está ligado a compania', client_token: @client.token}, status: :conflict
            else
                @company_client = CompanyClient.new(company: @company, client: @client)
                @company_client.save!
                render status: :created, json: { ok: 'cliente adicionado a compania', client_token: @client.token}
            end
        else
            @client = Client.new client_params
            @client.save!
            @company_client = CompanyClient.new(company: @company, client: @client)
            @company_client.save!
            render status: :created, json: { ok: 'cliente adicionado a compania', client_token: @client.token}
        end
    rescue ActiveRecord::RecordInvalid
        render json: @client.errors, status: :unprocessable_entity
    rescue ActionController::ParameterMissing
        render status: :precondition_failed, json: { errors: 'parâmetros inválidos'}
    rescue ActiveRecord::RecordNotFound
        render status: :not_found, json: { errors: 'compania não encontrada'}
    end

    private
    def client_params
        params.require(:client).permit(:name, :cpf)
    end
end