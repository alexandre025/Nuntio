require 'rails_helper'

RSpec.describe Billing, type: :model do
  it 'can be saved' do
    expect(build(:billing).save).to eq(true)
  end
end
