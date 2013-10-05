class CreateSpins < ActiveRecord::Migration
  def change
    create_table :spins do |t|
      t.datetime :off_time
      t.datetime :result_time
      t.string :result
      t.integer :location_id
      t.integer :user_id
      t.integer :session_id

      t.timestamps
    end
  end
end
