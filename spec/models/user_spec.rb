require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:time_zone) }
end
