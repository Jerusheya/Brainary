class CreateDonatingLists < ActiveRecord::Migration[6.1]
  def change
    create_table :donating_lists do |t|
      t.string :name
      t.string :book_name
      t.bigint :mobile
      t.string :address 

      t.timestamps
    end
  end
end
