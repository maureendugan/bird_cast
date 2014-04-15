# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Big Bird"
    username "OriginalTweeter"
    password "password"
    password_confirmation { |u| u.password }
    email "email@email.com"
  end
end
