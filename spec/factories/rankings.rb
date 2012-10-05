# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ranking do
    label "MyString"
    description "MyText"
    value "MyString"
    listing_id 1
  end
end
