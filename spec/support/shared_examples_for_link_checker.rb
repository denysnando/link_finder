# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'expectations for saved Google links' do
  let(:first_link) { scrape.scrape_links.first }
  let(:second_link) { scrape.scrape_links.second }
  let(:last_link) { scrape.scrape_links.last }

  it 'checks first link' do
    expect(first_link).to have_attributes(
      name: 'Imagens',
      url: 'https://www.google.com.br/imghp?hl=pt-BR&tab=wi'
    )
  end

  it 'checks the second link' do
    expect(second_link).to have_attributes(
      name: 'Maps',
      url: 'https://maps.google.com.br/maps?hl=pt-BR&tab=wl'
    )
  end

  it 'checks last link' do
    expect(last_link).to have_attributes(
      name: 'Termos',
      url: '/intl/pt-BR/policies/terms/'
    )
  end
end
