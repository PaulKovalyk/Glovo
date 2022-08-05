

RSpec.describe DishesController, type: :controller do
  let(:user) { create(:user, email: 'user@test.com', owner: false) }
  let(:user_owner) { create(:user, email: 'owner@test.com', owner: true) }
  before {sign_in(user_owner)}  

  let(:restaurant) { create(:restaurant, user_id: user_owner.id) }
  let(:dish) { create(:dish, restaurant_id: restaurant.id) }
  
  describe 'GET /index' do
    it 'returns http success' do
        get :index, params: { restaurant_id: restaurant.id }
      
      expect(response).to have_http_status(:success)
    end
  end
  describe 'GET /new/id' do
    let(:params) { { dish: { name: 'Kartoll9', price: 20},restaurant_id: restaurant.id ,id: dish.id }}
    it 'returns http success' do
      get :new, params: params
      expect(response).to have_http_status(:success)
    end
end

  describe 'GET /create' do
    let(:valid_params) do
      { dish: { name: 'Kapysta', price: '130.00', weight: '200'},
        restaurant_id: restaurant.id }
    end
    let(:invalid_params) do
      { dish: { name: '', price: '', weight: '' },
      restaurant_id: restaurant.id }
    end
    it 'creates success' do
      post :create, params: valid_params
      expect(response).to have_http_status(302)
    end

    it 'creation failed' do
      post :create, params: invalid_params
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_restaurant_dish_path)
    end
  end
  
  describe 'GET /update' do
    let(:params) { { dish: { name: 'Kartoll9', price: 20},restaurant_id: restaurant.id ,id: dish.id }}
    it 'update success' do
      put :update, params: params 
require 'rails_helper'
      dish.reload
      expect(dish.name).to eq('Kartoll9')
      expect(dish.price).to eq(20)
      expect(response).to redirect_to root_path
    end
     context 'when update is fail' do
        let(:params) { { dish: { name: '', price: 'ekk'},restaurant_id: restaurant.id ,id: dish.id  } }
  
        it 'update failed' do
          put :update, params: params
  
          dish.reload
          expect(dish.name).to eq(dish.name)
          expect(dish.price).to eq(dish.price)
          expect(response).to redirect_to(edit_restaurant_dish_path)
        end
      end
    end
 

end