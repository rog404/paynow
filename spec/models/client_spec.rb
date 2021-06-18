require 'rails_helper'

describe Client do
  context 'validation' do
    it 'attributes cannot be blank' do
      client = Client.new

      client.valid?

      expect(client.errors[:name]).to include('não pode ficar em branco')
      expect(client.errors[:cpf]).to include('não pode ficar em branco')
    end

    it 'and cpf must be unique' do
      Client.create!(name: 'Marcio', cpf: '01770967214')
      client = Client.create(name: 'Rogeiro', cpf: '01770967214')
      
      client.valid?
      expect(client.errors[:cpf]).to include('já está em uso')
    end
  end
end