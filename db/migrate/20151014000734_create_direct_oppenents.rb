class CreateDirectOppenents < ActiveRecord::Migration
  def change
    create_table :direct_oppenents do |t|

      t.timestamps null: false
    end
  end
end
