class CreateInboxes < ActiveRecord::Migration
  def change
    create_table :inboxes do |t|
        t.belongs_to :user

      t.timestamps null: false
    end
  end
end
