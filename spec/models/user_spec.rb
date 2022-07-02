# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#validation' do
    let(:user) { create(:user, email: 'tester@test.com') }

    before { user.save }

    it 'has a first name' do
      expect(user).to be_valid

      user.first_name = nil
      expect(user).not_to be_valid
    end

    it 'has a last name' do
      expect(user).to be_valid

      user.last_name = nil
      expect(user).not_to be_valid
    end

    it 'has a email' do
      expect(user).to be_valid

      user.email = nil
      expect(user).not_to be_valid
    end

    it 'first name between 3 and 20 characters long' do
      expect(user).to be_valid

      user.first_name = 'N'
      expect(user).not_to be_valid

      user.first_name = 'Alex' * 6
      expect(user).not_to be_valid
    end

    it 'has a last name between 3 and 20 characters long' do
      expect(user).to be_valid

      user.last_name = 'Du'
      expect(user).not_to be_valid

      user.last_name = 'Duoling' * 6
      expect(user).not_to be_valid
    end

    it 'has a email between 3 and 40 characters long' do
      expect(user).to be_valid

      user.email = 'em'
      expect(user).not_to be_valid

      user.email = 'tester@test.com' * 10
      expect(user).not_to be_valid, 'More than 40 characters'
    end

    context 'with email uniqueness' do
      let(:user1) { described_class.new(email: 'tester@test.com') }

      it { expect(user1).not_to be_valid }
    end
  end
end
