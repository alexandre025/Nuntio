require 'rails_helper'

RSpec.describe Tower, type: :model do
  let(:tower) { create(:tower, :with_category) }

  it 'can be saved' do
    expect(build(:tower, :with_category).save).to eq(true)
  end

  it 'has average notation' do
    10.times do
      create(:comment, commentable: tower, notation: 3)
    end

    expect(tower.average_notation).to eq(3)
  end
end
