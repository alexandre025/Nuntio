require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { create(:category, :with_theme) }

  it 'can be saved' do
    expect(build(:category, :with_theme).save).to eq(true)
  end
end
