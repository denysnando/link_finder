# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ScrapesHelper do

  describe '#display_scrape_name' do
    it 'displays the name when present' do
      scrape = build(:scrape, id: 1, name: 'Google', url: 'http://google.com')
      result = helper.display_scrape_name(scrape)

      expect(result).to include('Google')
    end

    it 'displays "page processing" when name is blank' do
      scrape = build(:scrape, name: nil)
      result = helper.display_scrape_name(scrape)
      expect(result).to eq('page processing')
    end
  end

  describe '#display_url_counter' do
    it 'displays the counter when it is positive' do
      scrape = build(:scrape, url_counter: 5)
      result = helper.display_url_counter(scrape)
      expect(result).to eq(5)
    end

    it 'displays "in progress" when the counter is not positive' do
      scrape = build(:scrape, url_counter: 0)
      result = helper.display_url_counter(scrape)
      expect(result).to eq('in progress')
    end
  end
end
