# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tweet do
    text Faker::Lorem.characters(80)
  end
end
