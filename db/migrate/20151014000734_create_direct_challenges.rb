class CreateDirectChallenges < ActiveRecord::Migration
  def change
    create_table :direct_challenges do |t|
        t.belongs_to :opponent
        t.belongs_to :challenge

      t.timestamps null: false
    end
  end
end
