require 'rails_helper'

RSpec.describe ReportSource, type: :model do
  it 'can be saved' do
    expect(build(:report_source).save).to eq(true)
  end
end
