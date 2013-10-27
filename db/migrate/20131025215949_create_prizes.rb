class CreatePrizes < ActiveRecord::Migration
  def change
    create_table :prizes do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
