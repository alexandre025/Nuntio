require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it 'can be saved' do
    expect(user.save).to eq(true)
  end
end
