class Boleto < PaymentMethod
    has_one :companion, class_name: "BoletoCompanion", inverse_of: :boleto, dependent: :destroy, autosave: true

    delegate :bank_code, :bank_agency, :bank_account, :bank_code=, :bank_agency=, :bank_account=, to: :lazily_build_companion

    validates :bank_code, :bank_agency, :bank_account, presence: true
    
    private
    def lazily_build_companion
        companion || build_companion
    end
end