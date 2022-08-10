class CreateSuggestBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :suggest_books do |t|
      t.string :user_name
      t.string :option
      t.string :Book_Or_Author_Name

      t.timestamps
    end
  end
end
