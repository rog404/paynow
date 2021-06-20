require 'rails_helper'

describe 'Admin view payment' do
    it 'successfully' do
        Payment.create!(description: 'Pix Verde', payment_type: 'pix', fee: 3.5, max_money_fee: 13.50)
            visit root_path
            click_on 'Modelos de Pagamento'

            expect(page).to have_content('PIX')
            expect(page).to have_content('Pix Verde')
            expect(page).to have_content('3,5')
            expect(page).to have_content('13,50')
    end
end