class AddRolesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :roles, null: false, foreign_key: true
  end
end
