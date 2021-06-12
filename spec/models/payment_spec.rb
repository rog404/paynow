require 'rails_helper'

describe Payment do
  context 'validation' do
    it 'attributes cannot be blank' do
      payment = Payment.new

      payment.valid?

      expect(payment.errors[:description]).to include('não pode ficar em branco')
      expect(payment.errors[:max_money_fee]).to include('não pode ficar em branco')
      expect(payment.errors[:fee]).to include('não pode ficar em branco')
    end
  end
end