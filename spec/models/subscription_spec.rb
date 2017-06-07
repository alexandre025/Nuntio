require 'rails_helper'

RSpec.describe Subscription, type: :model do
  let(:subscription) { create(:subscription) }

  it 'can be saved' do
    expect(build(:subscription).save).to eq(true)
  end

  it 'calculate and set amount' do
    expect(subscription.calculate_amount).to eq(subscription.tower.price_per_month)
  end
end
