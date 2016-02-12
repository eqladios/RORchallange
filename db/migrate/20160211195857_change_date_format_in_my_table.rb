class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def change
    change_column :trips, :date,  :date
    change_column :trips, :time,  :time
  end
end
