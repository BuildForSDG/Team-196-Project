FactoryBot.define do
    factory :records do
        specialist_id { Faker::Number.number(5) }
        description { Faker::Lorem.sentence }
        user_id { Faker::Number.number(5) }
        diagnosis { true }
    end
end