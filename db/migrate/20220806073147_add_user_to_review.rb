# frozen_string_literal: true

class AddUserToReview < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :users, null: false, foreign_key: true
  end
end
