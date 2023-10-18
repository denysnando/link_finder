# frozen_string_literal: true

class Scrape < ApplicationRecord
  # Relationship
  belongs_to :user
  has_many :scrape_links, dependent: :destroy

  # Validations
  validates :url, presence: true

  # Callbacks
  after_create :process_links

  def process_links
    LinkChecker.call(scrape: self)
  end
end
