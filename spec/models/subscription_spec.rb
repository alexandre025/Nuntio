require 'rails_helper'

RSpec.describe Subscription, type: :model do
  let(:subscription) { create(:subscription) }

  it 'can be saved' do
    expect(build(:subscription).save).to eq(true)
  end

  it 'calculate and set amount' do
    subscription.calculate_and_set_amount

    expect(subscription.amount).to eq(subscription.tower.price_per_month)
  end
end
