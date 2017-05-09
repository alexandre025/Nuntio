require 'rails_helper'

RSpec.describe Team, type: :model do
  let(:team) { build(:team) }

  it 'can be saved' do
    expect(team.save).to eq(true)
  end
end
