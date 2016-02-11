class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :home, :string
    add_column :users, :work, :string
  end
end
