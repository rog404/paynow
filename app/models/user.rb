class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :email, presence: true, if: :domain_check

  has_one :company
  belongs_to :company, optional: true

  enum role: [:admin, :owner, :employeer]

  before_save :default_values

  private
    def default_values
        self.role ||= find_role
    end

    DENY_DOMAINS = ["gmail.com", "yahoo.com", "hotmail.com", "gmail.com.br", "yahoo.com.br", "hotmail.com.br"]
    def domain_check
      if DENY_DOMAINS.any? { |word| email.end_with?(word)}
        errors.add(:email, "domínio de email não permitido")
      end
    end

    def find_user_company(domain)
      companies_hash = Company.all.to_a.map{|x| [x[:id], x[:email].split('@')[1]]}.to_h
      if companies_hash.key(domain)
        self.company = Company.find companies_hash.key(domain)
        :employeer
      else
        :owner
      end
    end

    def find_role
      domain = self.email.split('@')[1]
      if domain == 'paynow.com.br'
        :admin
      else
        find_user_company(domain)
      end
    end

end
