# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SpecialistMapper, type: :model do
  it { should validate_presence_of(:specialist) }
  it { should validate_presence_of(:specialization) }
  it { should belong_to(:specialist) }
end
