require 'rails_helper'

describe PaymentMethod do
    it 'attributes cannot be blank' do
      payment_method = PaymentMethod.new

      payment_method.valid?
      expect(payment_method.errors[:payment]).to include('não pode ficar em branco')
      expect(payment_method.errors[:company]).to include('não pode ficar em branco')
    end
end