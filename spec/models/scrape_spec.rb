# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Scrape, type: :model do
  let(:user) { create(:user) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:scrape_links) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:link) }

    it 'is valid with valid attributes' do
      scrape = build(:scrape, user:)
      expect(scrape).to be_valid
    end

    it 'is not valid without a name' do
      scrape = build(:scrape, name: nil, user:)
      expect(scrape).not_to be_valid
    end

    it 'is not valid without a link' do
      scrape = build(:scrape, link: nil, user:)
      expect(scrape).not_to be_valid
    end
  end
end
