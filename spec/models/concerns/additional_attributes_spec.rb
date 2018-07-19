require 'spec_helper'
require 'support/factory_girl'

shared_examples_for "additional_attribute" do

  before :each do
    @partner = Partner.first
    @user = build(:user, partner_id: @partner.id)
  end

  it "has a partner attribute as custom attribute with value as nil" do
    expect(@user.shoe_size).to eq(nil)
  end

  it "has a partner attribute as custom attribute with value as '7'" do
    @user.shoe_size = "7"
    expect(@user.shoe_size).to eq("7")
  end

  it "should have custom attribute with size greater than zero" do
    @user.shoe_size = "7"
    @user.save!
    expect(@user.custom_attributes.where(partner_attribute_id: @partner.partner_attributes.where(custom_attribute: "shoe_size"))).not_to be_empty
  end

end