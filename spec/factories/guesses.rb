FactoryBot.define do
  factory :guess do
    user { nil }
    thing_type { nil }
    completed { false }
  end
end
