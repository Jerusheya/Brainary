# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :password, length: { in: 6..12 },
                       unless: proc { |a| a.password.blank? }
  has_secure_password
  validates :email, presence: true, uniqueness: true,format: { with: URI::MailTo::EMAIL_REGEXP } 
  has_one_attached :book_pic
end
