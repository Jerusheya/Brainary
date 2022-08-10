class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  has_one_attached :book_pic
end
