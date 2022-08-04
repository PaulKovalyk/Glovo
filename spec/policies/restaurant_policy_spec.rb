require 'rails_helper'


RSpec.describe RestaurantPolicy, type: :policy do
  subject { described_class }
  
  let(:user) { create(:user) }
  let(:user_owner) { create(:user, email: 'owner@test.com', owner: true) }

  shared_examples "User/owner cant/can to do" do
    it "User can't to do" do
      expect(subject).not_to permit(user)
    end

    it 'Owner can to do' do
      expect(subject).to permit(user_owner)
    end
  end

  permissions :create? do
    include_examples "User/owner cant/can to do"
  end

  permissions :update? do
    include_examples "User/owner cant/can to do"
  end

  permissions :show? do
    include_examples "User/owner cant/can to do"
  end

end