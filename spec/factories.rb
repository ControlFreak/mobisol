FactoryGirl.define do

  factory :partner do
    name "mobisol"
  end


  factory :partner_attribute do
    custom_attribute "shoe_size"
  end

  factory :user do
    partner
    name "Amit"
    phone "9810450004"
    email "amitgupta2108@gmail.com"
  end

  factory :custom_attribute do
    user
    partner_attribute
    # value "7"
  end


end