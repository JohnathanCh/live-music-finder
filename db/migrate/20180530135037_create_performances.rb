class CreatePerformances < ActiveRecord::Migration[5.2]
  def change
    create_table :performances do |t|
      t.belongs_to :event
      t.belongs_to :artist

      t.timestamps
    end
  end
end
