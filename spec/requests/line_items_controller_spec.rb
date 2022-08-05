require 'rails_helper'
RSpec.describe LineItemsController, type: :controller do
    let(:user) { create(:user, email: 'user@test.com', owner: false) }
    before {sign_in(user)}  
  
    let(:restaurant) { create(:restaurant, user_id: user.id) }
    let(:dish) { create(:dish, restaurant_id: restaurant.id) }
    let(:cart) { create(:cart) }
    let(:line_item) { create(:line_item, dish_id: dish.id, cart_id: cart.id) }
  
    describe 'GET /create' do
      let(:valid_params) do
        { line_item: { quantity: '1'}, dish_id: dish.id, cart_id: cart.id }
      end
      let(:invalid_params) do
        { line_item: { quantity: '0'}, dish_id: dish.id, cart_id: cart.id }
      end
      it 'creates success' do
        post :create, params: valid_params
        expect(response).to have_http_status(302)
      end
      
      it 'creation failed' do
        post :create, params: invalid_params
        expect(response).to have_http_status(302)
      end
    end
    
    describe 'GET /destroy' do
      it 'destroed success' do
        delete :destroy, params: { id: line_item.id}
        expect(response).to have_http_status(302)
        end
    end
  end