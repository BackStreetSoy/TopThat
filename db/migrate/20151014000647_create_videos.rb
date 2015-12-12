class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
        t.string     :title 
        t.string     :data_content
        t.belongs_to :user 
        t.belongs_to :challenge

      t.timestamps null: false
    end
  end
end
