
FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end  
  factory :user do
    email  { FactoryGirl.generate(:email) }
    password "12312312"
    password_confirmation "12312312"
  end
end