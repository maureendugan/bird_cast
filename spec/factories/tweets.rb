# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tweet do
    user_id 1
    text "MyString"
  end
end
