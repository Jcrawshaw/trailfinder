FactoryGirl.define do
  factory :user do
    name "Sammy Palamar"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "helloworld"
    password_confirmation "hellowoworld"
    confirmed_at Time.now
  end

end
