class CreateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.text :text
      t.integer :user_id, foreign_key:true, null: false

      t.timestamps
    end
  end
end
