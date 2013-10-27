class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :ip_address
      t.boolean :active

      t.timestamps
    end
  end
end
