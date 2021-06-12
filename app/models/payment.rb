class Payment < ApplicationRecord
    validates :description, presence: true
    validates :max_money_fee, :fee, presence: true, numericality: {greater_than_or_equal_to: 0}

    enum state: [:disabled, :active]
    enum payment_type: [:pix, :boleto, :card]

    before_save :default_values 
    
    private
    def default_values
        self.state ||= :active
    end
end
