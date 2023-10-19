# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LinkChecker do
  describe '.call' do
    let(:scrape) { create(:scrape, url: 'https://www.google.com.br') }

    context 'when fetching and saving Google links', :vcr do
      before do
        VCR.use_cassette('google_links') do
          described_class.call(scrape:)
        end
      end

      it 'saves 36 Google links to the database' do
        expect(scrape.scrape_links.count).to be_positive
      end

      it_behaves_like 'expectations for saved Google links'
    end
  end
end
