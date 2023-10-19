# frozen_string_literal: true

class Scrape < ApplicationRecord
  # Relationship
  belongs_to :user
  has_many :scrape_links, dependent: :destroy

  # Validations
  validates :url, presence: true, format: { with: /\A#{URI::DEFAULT_PARSER.make_regexp}\z/ }

  # Callbacks
  after_create :process_links

  def process_links
    LinkCheckerWorker.perform_async(id)
  end
end
