module AdditionalAttributes
  extend ActiveSupport::Concern

  included do
    PartnerAttribute.all.each do |pa|

      ## Validations on custom attributes
      # validates pa.custom_attribute.to_sym, presence: true, if: Proc.new {|obj| obj.partner_id == pa.partner_id }

      ## Calbacks to store custom attributes
      before_save "add_custom_attribute_#{pa.custom_attribute}".to_sym

      ## Getter for custom_attributes
      define_method(pa.custom_attribute) do
        var_name = "@#{pa.custom_attribute}"
        instance_variable_get(var_name).presence || CustomAttribute.where(user_id: self.id, partner_attribute_id: pa.id).first.try(:value)
      end if Proc.new {|obj| obj.partner_id == pa.partner_id }

      ## Setter for custom attributes
      define_method("#{pa.custom_attribute}=") do |argument|
        var_name = "@#{pa.custom_attribute}"
        self.instance_variable_set(var_name, argument)
      end if Proc.new {|obj| obj.partner_id == pa.partner_id }

      ## Callbacks implementation
      define_method("add_custom_attribute_#{pa.custom_attribute}") do
        self.custom_attributes << CustomAttribute.new(user: self.id, partner_attribute_id: pa.id, value: self.send(pa.custom_attribute) )
      end if Proc.new {|obj| obj.partner_id == pa.partner_id }

    end

  end
end