class PixCompanion < ApplicationRecord
    belongs_to :pix, inverse_of: :companion
    validates :pix, presence: true
end
