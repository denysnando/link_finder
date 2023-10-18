# frozen_string_literal: true

class Scrape < ApplicationRecord
  # Relationship
  belongs_to :user
  has_many :scrape_links, dependent: :destroy

  # Validations
  validates :name, :link, presence: true
end
