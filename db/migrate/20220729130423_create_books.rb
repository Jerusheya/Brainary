# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.binary :book_pic
      t.string :name
      t.string :author
      t.text :description
      t.string :language

      t.timestamps
    end
  end
end
