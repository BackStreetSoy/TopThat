class CreateInboxes < ActiveRecord::Migration
  def change
    create_table :inboxes do |t|

      t.timestamps null: false
    end
  end
end
