require 'rails_helper'

RSpec.describe TowersController, type: :controller do
  render_views

  let(:tower) {create(:tower, :with_category)}
  let(:theme) { tower.category.theme}

  describe 'GET index' do

    it 'http status success' do
      get :index
      expect(response).to have_http_status(:success)
    end

  end

  describe 'GET theme' do

    it 'http status success' do
      get :theme, params: {id: theme.id}
      expect(response).to have_http_status(:success)
    end

  end

  describe 'GET category' do

    it 'http status success' do
      get :category, params:{theme_id: theme.id, id: tower.category.id}
      expect(response).to have_http_status(:success)
    end

  end

  describe 'GET show' do

    it 'http status success' do
      get :show, params: {id: tower.id}
      expect(response).to have_http_status(:success)
    end

  end
end
