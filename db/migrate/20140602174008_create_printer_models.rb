class CreatePrinterModels < ActiveRecord::Migration
  def change
    create_table :printer_models do |t|

      t.timestamps
    end
  end
end
