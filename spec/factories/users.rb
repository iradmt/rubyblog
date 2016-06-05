FactoryGirl.define do
  factory :user do
    name "Vasya Pupkin"
    email "vasya@vasya.com"
    password "securepassword"
    password_confirmation "securepassword"
  end
end
