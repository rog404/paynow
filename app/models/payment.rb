class Payment < ApplicationRecord
    validates :description, presence: true
    validates :max_money_fee, :fee, presence: true, numericality: {greater_than_or_equal_to: 0}

    enum state: [:disabled, :active]
    enum payment_type: [:pix, :boleto, :credit_card]

    before_save :default_values 
    
    def display_name
        "#{description} - taxa: #{fee}% até: R$ #{max_money_fee}"
    end

    private
    def default_values
        self.state ||= :active
    end

end
