# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LinkChecker do
  describe '.call' do
    let(:scrape) { create(:scrape, url: 'https://www.google.com.br') }

    it 'fetches links from Google and saves them to the database', :vcr do
      VCR.use_cassette('google_links') do
        described_class.call(scrape:)
      end

      expect(ScrapeLink.count).to eq(36)

      expect(ScrapeLink.first.name).to eq('Imagens')
      expect(ScrapeLink.first.url).to eq('https://www.google.com.br/imghp?hl=pt-BR&tab=wi')

      expect(ScrapeLink.last.name).to eq('Termos')
      expect(ScrapeLink.last.url).to eq('/intl/pt-BR/policies/terms/')
    end
  end
end
