# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :review_description
      t.bigint :review

      t.timestamps
    end
  end
end
