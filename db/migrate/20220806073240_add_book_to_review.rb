# frozen_string_literal: true

class AddBookToReview < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :books, null: false, foreign_key: true
  end
end
