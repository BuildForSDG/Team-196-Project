require 'rails_helper'

RSpec.describe Specialization, type: :model do
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:name) }
end
