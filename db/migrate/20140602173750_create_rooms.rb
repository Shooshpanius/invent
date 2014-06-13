class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.belongs_to :territory
      t.string :name
      t.timestamps
    end
  end
end
