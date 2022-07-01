# frozen_string_literal: true

require 'rails_helper'
require 'devise'

RSpec.describe User, type: :model do
  describe 'valid' do
    let(:user) { create(:user) }

    it "should  be valid " do
      expect(user).to be_valid 
    end
  end
  
end
