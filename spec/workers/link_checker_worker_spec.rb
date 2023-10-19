# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LinkCheckerWorker, type: :worker do
  it 'performs the worker' do
    VCR.use_cassette('google_links') do
      scrape = create(:scrape) # Supondo que você tenha uma factory para criar instâncias de Scrape
      allow(Scrape).to receive(:find).with(scrape.id).and_return(scrape)

      expect(LinkChecker).to receive(:call).with(scrape:)

      described_class.new.perform(scrape.id)
    end
  end
end
