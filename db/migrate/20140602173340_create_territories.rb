class CreateTerritories < ActiveRecord::Migration
  def change
    create_table :territories do |t|

      t.timestamps
    end
  end
end
