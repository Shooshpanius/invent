class CreateWorkplaces < ActiveRecord::Migration
  def change
    create_table :workplaces do |t|
      t.belongs_to :room
      t.string :name
      t.timestamps
    end
  end
end
