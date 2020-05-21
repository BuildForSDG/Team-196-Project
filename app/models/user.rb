# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :records, dependent: :destroy
  has_many :specialist_mappers, foreign_key: 'specialist_id'

  validates_presence_of :first_name, :last_name, :email, :password_digest
end
