require 'rails_helper'

RSpec.describe ReportsController, type: :controller do

  let(:tower) { create(:tower, :with_category) }
  let(:report) { create(:report, tower: tower) }

  describe 'GET #show' do

    it 'http status redirect' do
      get :show, params: { tower_id: tower.slug, id: report.id }
      expect(response).to have_http_status(:redirect)
    end

    context 'as logged in user' do
      login_user

      it 'redirect if user hasnt suscribed to tower' do
        get :show, params: { tower_id: tower.slug, id: report.id }
        expect(response).to have_http_status(:redirect)
      end

      it 'succeed if user suscribed to tower' do
        subscription = create(:subscription, tower: tower, owner: controller.view_context.current_user)
        subscription.to_payment
        subscription.confirm

        expect(response).to have_http_status(:success)
      end

    end

  end

end
