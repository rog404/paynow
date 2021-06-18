require 'rails_helper'

describe CompanyClient do
  context 'validation' do
    it 'attributes cannot be blank' do
      company_client = CompanyClient.new

      company_client.valid?

      expect(company_client.errors[:company_id]).to include('não pode ficar em branco')
      expect(company_client.errors[:client_id]).to include('não pode ficar em branco')
    end
  end
end