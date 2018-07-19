class Partner < ApplicationRecord

  ## Associations
  has_many :users
  has_many :partner_attributes

  ## Validations
  validates :name, presence: true

end
