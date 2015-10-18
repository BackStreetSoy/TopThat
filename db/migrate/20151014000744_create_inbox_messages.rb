class CreateInboxMessages < ActiveRecord::Migration
  def change
    create_table :inbox_messages do |t|

      t.timestamps null: false
    end
  end
end
