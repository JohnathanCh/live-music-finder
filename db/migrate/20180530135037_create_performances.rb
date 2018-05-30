class CreatePerformances < ActiveRecord::Migration[5.2]
  def change
    create_table :performances do |t|

      t.timestamps
    end
  end
end
