require 'rails_helper'

describe User do
  context 'validation' do
    it 'attributes cannot be blank' do
      user = User.new

      user.valid?

      expect(user.errors[:email]).to include('não pode ficar em branco')
      expect(user.errors[:password]).to include('não pode ficar em branco')
    end

    it 'email must be unique' do
      User.create!(name: 'Marcio', email: 'rogerio@grupomilla.com', password: '123456')
      user = User.new(name: 'Rogeiro', email: 'rogerio@grupomilla.com', password: '123456')
      
      user.valid?
      expect(user.errors[:email]).to include('já está em uso')
    end

    it 'only non-public emails' do
      user = User.new(name: 'Rogeiro', email: 'rogerio@gmail.com', password: '123456')
      
      user.valid?
      expect(user.errors[:email]).to include('domínio de email não permitido')
    end

    it 'create user as Admin' do
      user = User.create!(name: 'Rogerio', email: 'rogerio@paynow.com.br', password: '123456')
      expect(user.role).to eq('admin')
    end

    it 'create user as Employeer' do
      company = Company.create!(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA', email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')
      user = User.create!(name: 'Rogerio', email: 'rogerio@codeplay.com.br', password: '123456')
      expect(user.role).to eq('employeer')
      #expect(user.company).to eq(company)
    end
  end
end

#User.create!(name: 'Henrique', email: 'henrique@campuscode.com.br', password: '123456')