# frozen_string_literal: true

class User < ApplicationRecord
  # REGEX
  VALID_EMAIL_REGEX = /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
  VALID_USERNAME_REGEX = /\A[a-zA-Z0-9_.]+\z/

  # Relationship
  has_many :scrapes, dependent: :destroy

  # Validations
  validates :username, presence: true, uniqueness: true, format: { with: VALID_USERNAME_REGEX }
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true

  has_secure_password
end
