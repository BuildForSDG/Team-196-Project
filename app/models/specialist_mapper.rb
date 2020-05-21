# frozen_string_literal: true

class SpecialistMapper < ApplicationRecord
  belongs_to :specialist, class_name: 'User'
  belongs_to :specialization

  validates_presence_of :specialist, :specialization
end
