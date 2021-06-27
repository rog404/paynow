class Api::V1::ClientsController < ActionController::API
    def index
        @clients = Client.all
        render json: @clients.as_json(except: [:id, :created_at, :updated_at])
    end

    def show
        @client = Client.find_by!(token: params[:token])
        render json: @client.as_json(except: [:id, :created_at, :updated_at])
    rescue ActiveRecord::RecordNotFound
        head 404
    end

    def create
        @client = Client.new(client_params)
        @client.save!
        render json: @client.as_json(except: [:id, :created_at, :updated_at]), status: :created
    rescue
        render json: @client.errors, status: :unprocessable_entity
    end

    private
    def client_params
        params.require(:client).permit(:name, :cpf)
        
    end
end