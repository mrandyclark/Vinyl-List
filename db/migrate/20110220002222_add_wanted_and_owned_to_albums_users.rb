class AddWantedAndOwnedToAlbumsUsers < ActiveRecord::Migration
  def self.up
    add_column :albums_users, :owned, :bool, :default => false
    add_column :albums_users, :wanted, :bool, :default => false
  end

  def self.down
    remove_column :albums_users, :owned
    remove_column :albums_users, :wanted
  end
end
