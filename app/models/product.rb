class Product < ApplicationRecord
  belongs_to :company

  validates :name, :token, presence: true
  
end
