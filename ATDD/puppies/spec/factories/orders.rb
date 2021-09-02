FactoryGirl.define do
  factory :order do
    name 'Sam'
    address '123 Main Street'
    email 'sam@example.com'
    pay_type 'Credit card'
    has_children true
    has_other_pets true
    other_pets_description 'Antoher dog named Koda'
  end
end

