class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def change
    change_column :trips, :date, 'date USING CAST(date AS date)'
    change_column :trips, :time, 'time USING CAST(time AS time)'
  end
end
