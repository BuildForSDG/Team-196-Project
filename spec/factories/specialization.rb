# frozen_string_literal: true

FactoryBot.define do
  factory :specialization do
    description { Faker::Lorem.sentence }
    name { Faker::Name.name }
  end
end
