# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    author_id 1
    name "MyString"
    notes "MyText"
    symbol "MyString"
    type ""
  end
end
