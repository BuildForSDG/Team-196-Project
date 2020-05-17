FactoryBot.define do
    factory :record do
        specialist_id { Faker::Number.number(digits: 5) }
        description { Faker::Lorem.sentence }
        user_id { Faker::Number.number(digits: 5) }
        diagnosis { true }
    end
end

