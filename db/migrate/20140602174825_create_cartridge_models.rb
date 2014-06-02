class CreateCartridgeModels < ActiveRecord::Migration
  def change
    create_table :cartridge_models do |t|

      t.timestamps
    end
  end
end
