# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ScrapeLink, type: :model do
  let(:scrape) { create(:scrape) }

  describe 'associations' do
    it { is_expected.to belong_to(:scrape) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:link) }

    it 'is valid with valid attributes' do
      scrape_link = build(:scrape_link, scrape:)
      expect(scrape_link).to be_valid
    end

    it 'is not valid without a name' do
      scrape_link = build(:scrape_link, name: nil, scrape:)
      expect(scrape_link).not_to be_valid
    end

    it 'is not valid without a link' do
      scrape_link = build(:scrape_link, link: nil, scrape:)
      expect(scrape_link).not_to be_valid
    end
  end
end
