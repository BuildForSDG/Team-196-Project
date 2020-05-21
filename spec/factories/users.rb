# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    email { 'foobar@help.com' }
    password { 'foobar' }
  end
end
