class AddIndexesToMemberships < ActiveRecord::Migration
  def change
    add_index :memberships, :user_id
    add_index :memberships, :trip_id
    add_index :memberships, [:user_id, :trip_id], unique: true
  end
end
