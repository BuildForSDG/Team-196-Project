# frozen_string_literal: true

FactoryBot.define do
  factory :record do
    specialist_id { Faker::Number.number(digits: 5) }
    description { Faker::Lorem.sentence }
    diagnosis { true }
    association :user
  end
end
