class AddTripIdToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :trip_id, :integer
  end
end
