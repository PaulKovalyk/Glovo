require 'rails_helper'

RSpec.describe RestaurantsController, type: :controller do
  let(:user) { create(:user, email: 'owner@test.com', owner: true) }
 
  before do
    sign_in(user)
  end
  let(:restaurant) { create(:restaurant, user_id: user.id) }


  describe 'GET /index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show/id' do
    it 'returns http success' do
      get :show, params: { id: restaurant.id }
      expect(response).to have_http_status(:success)
    end
end

  
  describe 'GET /create' do
    let(:valid_params) do
      { restaurant: { name: 'MacDonalds', address: 'Volodymyra Velukoho', description: 'Best burgers on district', user_id: user.id } }
    end
    let(:invalid_params) { { restaurant: { name: '', address: '', description: '', user_id: user.id } } }

    it 'creates success' do
      post :create, params: valid_params
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_path)
    end

    it 'creation failed' do
      post :create, params: invalid_params
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_restaurant_path)
    
    end
  end
   
    describe 'GET /update' do
    let(:params) { { restaurant: { name: 'Chicago', address: 'Lypova' },id: restaurant.id}}
    it 'update success' do
      put :update, params: params

      restaurant.reload
      expect(restaurant.name).to eq('Chicago')
      expect(restaurant.address).to eq('Lypova')
      expect(response).to redirect_to(root_path)
    end
    context 'when update is fail' do
        let(:params) { { restaurant: { name: '', address: 'Lypo'}, id: restaurant.id } }
  
        it 'update failed' do
          put :update, params: params
  
          restaurant.reload
          expect(restaurant.name).to eq(restaurant.name)
          expect(restaurant.address).to eq(restaurant.address)
          expect(response).to redirect_to(edit_restaurant_path)
        end
      end
    end

  

end