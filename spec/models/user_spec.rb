# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }

    it 'validates format of username' do
      user = build(:user, username: 'username with spaces')
      expect(user).not_to be_valid
    end

    it 'validates format of email' do
      user = build(:user, email: 'invalid-email')
      expect(user).not_to be_valid
    end
  end
end
