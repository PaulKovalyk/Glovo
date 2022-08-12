# frozen_string_literal: true

RSpec.describe CartsController, type: :controller do
  let(:user) { create(:user, email: 'user@test.com', owner: false) }
  let(:restaurant) { create(:restaurant, user_id: user.id) }
  let(:dish) { create(:dish, restaurant_id: restaurant.id) }
  let(:line_item) { create(:line_item, dish_id: dish.id, cart_id: cart.id) }
  let(:cart) { create(:cart) }

  before { sign_in(user) }

  describe 'GET /show/id' do
    it 'returns http success' do
      get :show, params: { id: cart.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destory' do
    it 'destroed success' do
      delete :destroy, params: { id: cart.id }

      expect(response).to have_http_status(:found)
      expect(response).to redirect_to root_path
    end
  end
end
