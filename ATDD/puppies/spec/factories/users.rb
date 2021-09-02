FactoryGirl.define do
  factory :user do
    name 'Joe'
    password 'Derp!'
    hashed_password 'pass'
    salt 'salt'
  end
end
