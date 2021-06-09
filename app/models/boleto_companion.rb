class BoletoCompanion < ApplicationRecord
    belongs_to :boleto, inverse_of: :companion
    validates :boleto, presence: true
end
