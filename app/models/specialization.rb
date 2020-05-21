# frozen_string_literal: true

class Specialization < ApplicationRecord
  validates_presence_of :name, :description
end
