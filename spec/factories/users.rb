# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    username Faker::Internet.user_name
    password Faker::Internet.password
    password_confirmation { |u| u.password }
    email Faker::Internet.email
  end
end
