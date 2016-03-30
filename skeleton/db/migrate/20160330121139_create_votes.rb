class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :voteable_id, null: false, index: true
      t.string :voteable_type, null: false, index: true
      t.references :user, null: false, index: true
      t.integer :source_id, null: false

      t.timestamps null: false
    end
  end
end