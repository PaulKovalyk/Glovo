require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:user) { create(:user, email: 'owner@test.com', owner: false) }
 
  
  before do
    sign_in(user)
  end


  let(:order) { create(:order, user_id: user.id) }
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

  describe 'GET /create' do
        let(:valid_params) do
        { order: { name: 'Anton', address: 'Volodymyra Velukoho', email: 'anton@test.com',pay_type: 'cash' ,user_id: user.id } }
        end
        let(:invalid_params) { { order: { name: '', address: '', email: 'anton.com', user_id: user.id } } }

        it 'creates success' do
        post :create, params: valid_params
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
        end

        it 'creation failed' do
            post :create, params: invalid_params
            expect(response).to have_http_status(302)
            
            expect(response).to redirect_to cart_path(1)
        end
   end
    
  
end