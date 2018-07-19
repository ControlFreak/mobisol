class User < ApplicationRecord

  include AdditionalAttributes

  ## Associations
  belongs_to :partner
  has_many :custom_attributes

  ## Validations
  validates :name, :phone, :email, :partner_id, presence: true

end
