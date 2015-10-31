class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
        t.belongs_to :replier 
        t.references :repliable, polymorphic: true, index: true 


        t.timestamps null: false
    end
  end
end
