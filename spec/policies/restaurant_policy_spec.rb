# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RestaurantPolicy, type: :policy do
  subject { described_class }

  let(:user) { create(:user) }
  let(:user_owner) { create(:user, email: 'owner@test.com', owner: true) }

  

  permissions :create? do
    include_examples 'Only owner can'
  end

  permissions :update? do
    include_examples 'Only owner can'
  end

  permissions :show? do
    include_examples 'Only owner can'
  end
end
