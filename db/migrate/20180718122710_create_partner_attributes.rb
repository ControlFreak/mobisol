class CreatePartnerAttributes < ActiveRecord::Migration[5.0]
  def change
    create_table :partner_attributes do |t|
      t.references :partner
      t.string    :custom_attribute
      t.timestamps
    end
  end
end
