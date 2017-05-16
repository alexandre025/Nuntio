require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  render_views

  describe 'GET index' do

    it 'http status success' do
      get :index
      expect(response).to have_http_status(:success)
    end

  end

  describe 'GET dashboard' do

    it 'http status redirect' do
      get :dashboard
      expect(response).to have_http_status(:redirect)
    end

    context 'as logged in user' do
      login_user

      it 'http status success' do
        get :dashboard
        expect(response).to have_http_status(:success)
      end

    end

  end

end
