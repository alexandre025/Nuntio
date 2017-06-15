require 'rails_helper'

RSpec.describe Subscription, type: :model do
  let(:user) { create(:user) }
  let(:subscription) { create(:subscription, owner: user, commitment: :yearly, quantity: 5) }

  it 'can be saved' do
    expect(build(:subscription).save).to eq(true)
  end

  it 'calculate and set amount' do
    expect(subscription.calculate_amount).to eq(subscription.tower.price_per_month * subscription.quantity - subscription.total_discount)
  end

  context 'is confirmed' do
    before :each do
      subscription.to_payment
      subscription.confirm
    end

    it 'put owner as a confirmed subscriber' do
      expect(user.confirmed_subscriptions).to include(subscription)
    end

    it 'has one first billing' do
      expect(subscription.billings.count).to eq(1)
    end

  end
end
