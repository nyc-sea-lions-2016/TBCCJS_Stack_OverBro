class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, null: false, index: true
      t.integer :voteable_id, null: false
      t.string :voteable_type, null: false, index: true
      t.integer :value

      t.timestamps null: false
    end
  end
end
