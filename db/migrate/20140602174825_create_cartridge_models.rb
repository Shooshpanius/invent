class CreateCartridgeModels < ActiveRecord::Migration
  def change
    create_table :cartridge_models do |t|
      t.string :model
      t.string :model_code
      t.string :comment
      t.integer :resource
      t.timestamps
    end
  end
end
