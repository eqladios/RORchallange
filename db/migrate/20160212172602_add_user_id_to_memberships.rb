class AddUserIdToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :user_id, :integer
  end
end
