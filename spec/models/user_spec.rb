# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'update' do
    let(:user) { create(:user) }
    let(:first_name) { 'Alex' }
    let(:last_name) { 'Doe' }

    it 'updates user' do
      user.update(first_name: first_name)
      expect(user.reload.first_name).to eq('Alex')
    end
  end
end
