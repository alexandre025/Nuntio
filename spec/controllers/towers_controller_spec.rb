require 'rails_helper'

RSpec.describe TowersController, type: :controller do
  render_views

  describe 'GET index' do

    it 'http status success' do
      get :index
      expect(response).to have_http_status(:success)
    end

  end

  describe 'GET theme' do


    it 'http status success' do
      get :theme
      expect(response).to have_http_status(:success)
    end

  end

  describe 'GET show' do

    it 'http status success' do
      get :show
      expect(response).to have_http_status(:success)
    end

  end
end
