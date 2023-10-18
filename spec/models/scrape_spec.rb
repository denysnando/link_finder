# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Scrape do
  let(:user) { create(:user) }
  let(:scrape) { create(:scrape) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:scrape_links) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:url) }
  end

  describe 'callbacks' do
    it 'calls process_links after creation' do
      allow(LinkChecker).to receive(:call)

      expect(LinkChecker).to have_received(:call).with(scrape:)

      scrape.save
    end
  end

  describe '#process_links' do
    it 'calls LinkChecker' do
      allow(LinkChecker).to receive(:call)

      expect(LinkChecker).to have_received(:call).with(scrape:)
    end
  end
end
