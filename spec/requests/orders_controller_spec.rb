# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:user) { create(:user) }
  let(:restaurant) { create(:restaurant, user: user_owner) }
  let(:order) { create(:order, user: user) }
  let(:user_owner) { create(:user, email: 'owner@test.com', owner: true) }

  before do
    sign_in(user)
  end

  describe 'GET /index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    let(:valid_params) do
      { order: { name: 'Anton', address: 'Volodymyra Velukoho', email: 'anton@test.com', pay_type: 'cash',
                 user_id: user.id } }
    end
    let(:invalid_params) { { order: { name: '', address: '', email: 'anton.com', user_id: user.id } } }

    it 'creates success' do
      post :create, params: valid_params
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(root_path)
    end

    it 'creation failed' do
      post :create, params: invalid_params
      expect(response).to have_http_status(:found)

      expect(response).to redirect_to cart_path(1)
    end
  end

  describe 'GET /destory' do
    it 'destroed success' do
      delete :destroy, params: { id: order.id }

      expect(response).to have_http_status(:found)
      expect(response).to redirect_to orders_path
    end
  end

  describe 'GET /update' do
    let(:params) { { order: { name: 'Yulia', address: 'Lypovaa' }, id: order.id } }

    it 'update success' do
      put :update, params: params

      order.reload
      expect(order.name).to eq('Yulia')
      expect(order.address).to eq('Lypovaa')
      expect(response).to redirect_to orders_path
    end
  end
end
