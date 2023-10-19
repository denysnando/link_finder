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
    it 'queues LinkCheckerWorker after creation' do
      expect { scrape.save }.to change(LinkCheckerWorker.jobs, :size).by(1)
    end
  end
end
