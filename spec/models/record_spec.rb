# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Record, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it { should belong_to(:user) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:diagnosis) }
end
