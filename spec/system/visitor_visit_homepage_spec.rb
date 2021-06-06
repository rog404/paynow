require 'rails_helper'

describe 'Visiter' do
    context 'visit homepage' do
        it 'successfully' do
            visit root_path

            expect(page).to have_content('paynow')
        end
    end
end