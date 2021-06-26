class ClientsController < AutenticationController
    before_action :set_company, only: %i[index show create]
    before_action :set_client, only: %i[show]

    def index
        @clients = @company.clients
    end

    def new
        @client = Client.new
    end

    def create
    end

    private
    def set_company
        @company = Company.find params[:company_id]
    end

    def set_client
        @client = Client.find params[:id]        
    end

    def client_params
        params.require(:client).permit(:name, :cpf)
    end
end