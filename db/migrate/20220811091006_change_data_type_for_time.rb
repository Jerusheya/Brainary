class ChangeDataTypeForTime < ActiveRecord::Migration[6.1]
  def change
    change_column(:schedule_times, :time, :string)
  end
  def up
    change_column :schedule_times, :time, :string
  end
  def down
    change_column :schedule_times, :time, :time
  end
end
