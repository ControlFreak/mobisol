class CustomAttribute < ApplicationRecord

  ## Associations
  belongs_to :user
  belongs_to :partner_attribute

  ## Validations
  validates :value, presence: true

end
