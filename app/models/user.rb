# frozen_string_literal: true

class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_secure_password
  before_save { self.email = email.downcase }
  validates :name,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 6, maximum: 12 }

  EMAIL_VALIDATE = /\A(\S+)@(.+)\.(\S+)\z/.freeze
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 100 },
            format: { with: EMAIL_VALIDATE }
end
