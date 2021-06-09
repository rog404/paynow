class CreditCardCompanion < ApplicationRecord
    belongs_to :credit_card, inverse_of: :companion
    validates :credit_card, presence: true
end
