require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { create(:comment) }

  it 'can be saved' do
    expect(build(:comment).save).to eq(true)
  end
end
