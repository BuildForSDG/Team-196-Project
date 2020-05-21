# frozen_string_literal: true

FactoryBot.define do
  factory :specialist_mapper do
    association :specialist, factory: :user
    association :specialization
  end
end
