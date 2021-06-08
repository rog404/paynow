class CreditCard < PaymentMethod
    has_one :companion, class_name: "CreditCardCompanion", inverse_of: :credit_card, dependent: :destroy, autosave: true

    delegate :code, :code=, to: :lazily_build_companion

    validates :code, presence: true

    private
    def lazily_build_companion
        companion || build_companion
    end
end