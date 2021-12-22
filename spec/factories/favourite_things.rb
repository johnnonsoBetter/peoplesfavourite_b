FactoryBot.define do
  factory :favourite_thing do
    sequence(:name) {|n| "name #{n}"}
    
    user { nil }
   
  end
end
