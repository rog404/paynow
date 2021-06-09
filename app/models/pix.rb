class Pix < PaymentMethod
    has_one :companion, class_name: "PixCompanion", inverse_of: :pix, dependent: :destroy, autosave: true

    delegate :key, :bank_code, :key=, :bank_code=, to: :lazily_build_companion

    validates :key, :bank_code, presence: true

    private
    def lazily_build_companion
        companion || build_companion
    end
end