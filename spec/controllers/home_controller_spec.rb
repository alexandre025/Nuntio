require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  # render_views

  describe 'GET #index' do

    it 'http status success' do
      get :index
      expect(response).to have_http_status(:success)
    end

  end

end
