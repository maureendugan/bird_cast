# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  sequence :name do |n|
    name = Faker::Name.name
  end

  sequence :username do |n|
    username = Faker::Internet.user_name
  end

  factory :user do
    name
    username
    password Faker::Internet.password
    password_confirmation { password }
    email Faker::Internet.email
  end
end
