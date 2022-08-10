class CreateDonateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :donate_books do |t|
      t.string :user_name
      t.string :mobile
      t.string :book_name
      t.string :language
      t.text :address

      t.timestamps
    end
  end
end
