class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
        t.datetime  :activated_at
        t.boolean   :private

      t.timestamps null: false
    end
  end
end
