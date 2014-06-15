class CreateStockrooms < ActiveRecord::Migration
  def change
    create_table :stockrooms do |t|

      t.timestamps
    end
  end
end
