FactoryBot.define do
  factory :favourite_thing do
    sequence(:name) {|n| "name #{n}"}
    photo { "MyString" }
    user { nil }
  end
end
