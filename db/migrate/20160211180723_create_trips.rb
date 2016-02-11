class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :time
      t.string :date
      t.string :source
      t.string :destination

      t.timestamps null: false
    end
  end
end
