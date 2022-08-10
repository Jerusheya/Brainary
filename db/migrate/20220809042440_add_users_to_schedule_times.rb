class AddUsersToScheduleTimes < ActiveRecord::Migration[6.1]
  def change
    add_reference :schedule_times, :users, null: false, foreign_key: true
  end
end
