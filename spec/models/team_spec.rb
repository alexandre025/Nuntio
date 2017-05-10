require 'rails_helper'

RSpec.describe Team, type: :model do

  it 'can be saved' do
    expect(build(:team).save).to eq(true)
  end

  it 'create a new tenant' do
    team = create(:team)
    expect(Apartment.tenant_names).to include(team.code)
  end

  it 'and switch to this new tenant' do
    team = create(:team)
    expect(Apartment::Tenant.switch!(team.code))
  end

end
