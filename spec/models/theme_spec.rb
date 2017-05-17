require 'rails_helper'

RSpec.describe Theme, type: :model do
  let(:theme) { create(:theme) }

  it 'can be saved' do
    expect(build(:theme).save).to eq(true)
  end

  it 'has categories' do
    expect(theme.categories.count).to eq(10)
  end
end
