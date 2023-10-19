# frozen_string_literal: true

module ScrapesHelper
  def display_scrape_name(scrape)
    if scrape.name.present?
      link_to scrape.name, scrape_path(scrape.id)
    else
      'page processing'
    end
  end

  def display_url_counter(scrape)
    if scrape.url_counter.to_i.positive?
      scrape.url_counter
    else
      'in progress'
    end
  end
end
