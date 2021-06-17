require 'rails_helper'

describe Product do
  context 'validation' do
    it 'attributes cannot be blank' do
      product = Product.new

      product.valid?

      expect(product.errors[:name]).to include('não pode ficar em branco')
      expect(product.errors[:price]).to include('não pode ficar em branco')
    end

    it 'discount must be numerical and greater or equal to 0' do
      product = Product.new(name: 'Curso Rails', price: '200', discount_pix: 'ABC', discount_boleto: -45, discount_credit_card: 30)

      product.valid?

      expect(product.errors[:discount_pix]).to include('não é um número')
    end
  end
end