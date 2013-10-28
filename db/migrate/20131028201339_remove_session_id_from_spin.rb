class RemoveSessionIdFromSpin < ActiveRecord::Migration
  def up
    remove_column :spins, :session_id
  end

  def down
    add_column :spins, :session_id, :integer
  end
end
