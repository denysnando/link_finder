# frozen_string_literal: true

class LinkChecker
  def self.call(scrape:)
    new(scrape:).call
  end

  def initialize(scrape:)
    @scrape = scrape
  end

  def call
    scrape_links
  end

  private

  attr_reader :scrape

  def scrape_links
    url = scrape.url
    url = "https://#{url}" unless url.start_with?('http://', 'https://')

    page = Nokogiri::HTML(URI.open(url).read)

    page_title = page.css('title').text
    links = extract_links(page)
    save_links_to_database(links)
    update_scrape_info(page_title, links.count)
  end

  def extract_links(page)
    page.css('a').filter_map do |link|
      text = link.text.empty? ? link.css('img').to_s : link.text
      href = link['href']

      next if href.include?('javascript:void(0)')

      { href:, text: }
    end
  end

  def save_links_to_database(links)
    links.each do |link|
      ScrapeLink.create(
        name: link[:text],
        url: link[:href],
        scrape_id: scrape.id
      )
    end
  end

  def update_scrape_info(page_title, link_count)
    scrape.update(name: page_title, url_counter: link_count)
  end
end
