class CreateCustomAttributes < ActiveRecord::Migration[5.0]
  def change
    create_table :custom_attributes do |t|
      t.references  :user
      t.references  :partner_attribute
      t.string      :value
      t.timestamps
    end
  end
end
