require 'rails_helper'

RSpec.describe Report, type: :model do
  it 'can be saved' do
    expect(build(:report).save).to eq(true)
  end
end
