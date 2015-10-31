class CreateInboxMessages < ActiveRecord::Migration
  def change
    create_table :inbox_messages do |t|
        t.belongs_to :inbox
        t.belongs_to :message

      t.timestamps null: false
    end
  end
end
