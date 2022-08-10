# frozen_string_literal: true

class AddCategoriesToBook < ActiveRecord::Migration[6.1]
  def change
    add_reference :books, :categories, null: false, foreign_key: true
  end
end
