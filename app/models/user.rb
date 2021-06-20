class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  enum role: [:admin, :owner, :employeer]

  before_save :default_values
    
  private
    def default_values
        self.role ||= find_role
    end

    def find_role
      domain = self.email.split('@')[1]
      :admin if domain == 'paynow.com.br'
      :employeer
    end
end
