require 'rails_helper'

RSpec.describe TowerGuard, type: :model do
  it 'can be saved' do
    expect(build(:tower_guard).save).to eq(true)
  end
end
