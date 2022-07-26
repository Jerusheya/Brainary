# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.bigint :mobile
      t.string :email
      t.string :password_digest
      t.integer :batch
      t.binary :profile_pic

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
