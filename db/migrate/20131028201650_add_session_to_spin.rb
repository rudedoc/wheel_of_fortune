class AddSessionToSpin < ActiveRecord::Migration
  def up
    add_column :spins, :session_id, :string
  end

  def down
    remove_column :spins, :session_id
  end
end
