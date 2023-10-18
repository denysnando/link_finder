# frozen_string_literal: true

class ScrapeLink < ApplicationRecord
  # Relationship
  belongs_to :scrape

  # Validations
  validates :name, :link, presence: true
end
