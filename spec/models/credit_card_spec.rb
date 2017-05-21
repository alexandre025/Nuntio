require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  it 'can be saved' do
    expect(build(:credit_card).save).to eq(true)
  end
end
