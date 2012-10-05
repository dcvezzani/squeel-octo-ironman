# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :listing do
    name "MyString"
    content "MyText"
    audience_id 1
    category_id 1
    author_id 1
  end
end
