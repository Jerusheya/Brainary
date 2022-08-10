# frozen_string_literal: true

class CreateSuggestBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :suggest_books do |t|
      t.string :option
      t.string :name

      t.timestamps
    end
  end
end
