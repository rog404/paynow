class CompanyClient < ApplicationRecord
  belongs_to :company
  belongs_to :client

  validates :client_id, :company_id, presence: true
end
