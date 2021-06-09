class PaymentMethod < ApplicationRecord
    validates :fee, presence: true
    validates :max_money_fee, presence: true, numericality: {greater_than_or_equal_to: 0}

    enum state: [:disabled, :active]
    
    before_save :default_values 
    
    private
    def default_values
        self.state ||= :active
    end
end
