FactoryBot.define do
  factory :fighter do
    name { Faker::Name.unique.name }
    nickname { Faker::Name.middle_name }
    age { Faker::Number.between(from: 18, to: 40) }
    weightclass { Faker::String.random(length: 10) }
    rank { Faker::Number.between(from: 0, to: 15) }
  end
end
