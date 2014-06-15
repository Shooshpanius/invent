class CreatePrinters < ActiveRecord::Migration
  def change
    create_table :printers do |t|
      t.string :inv_number
      t.belongs_to :printer_model
      t.string :comment
      t.timestamps
    end
  end
end
