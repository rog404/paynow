require 'rails_helper'

describe Company do
  context 'validation' do
    it 'attributes cannot be blank' do
      company = Company.new

      company.valid?

      expect(company.errors[:name]).to include('não pode ficar em branco')
      expect(company.errors[:cnpj]).to include('não pode ficar em branco')
      expect(company.errors[:email]).to include('não pode ficar em branco')
      expect(company.errors[:address]).to include('não pode ficar em branco')
    end

    it 'cnpj must be uniq' do
      Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA', email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')
      company = Company.new(cnpj: '87470788000188')

      company.valid?

      expect(company.errors[:cnpj]).to include('já está em uso')
    end
    
    it 'email must be valid' do
      company = Company.new(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA', email: 'faturamodepla.br', address: 'Av. Dutra, 4563, São Paulo - SP')

      company.valid?

      expect(company.errors[:email]).to include('não é válido')
    end
  end
end