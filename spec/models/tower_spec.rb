require 'rails_helper'

RSpec.describe Tower, type: :model do
  let(:tower) { create(:tower, :with_category) }

  it 'can be saved' do
    expect(build(:tower, :with_category).save).to eq(true)
  end
end
