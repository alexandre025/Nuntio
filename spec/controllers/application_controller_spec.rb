require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  it 'set current team' do
    expect(controller.view_context.current_team).to eq(@current_team)
  end

end
