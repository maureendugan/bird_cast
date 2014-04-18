# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :text do |n|
    @text = Faker::Lorem.sentence
  end

  factory :tweet do
    text
    user
  end
end
