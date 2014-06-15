class CreateCartridges < ActiveRecord::Migration
  def change
    create_table :cartridges do |t|
      t.string :inv_number
      t.belongs_to :room
      t.belongs_to :printer
      t.belongs_to :cartridge_model
      t.string :comment

      t.timestamps
    end
  end
end
