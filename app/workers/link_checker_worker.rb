# frozen_string_literal: true

class LinkCheckerWorker
  include Sidekiq::Worker

  def perform(scrape_id)
    scrape = Scrape.find(scrape_id)

    LinkChecker.call(scrape:)
  end
end
