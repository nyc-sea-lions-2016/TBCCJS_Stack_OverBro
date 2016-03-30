class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :vote_type_id, null: false, index: true
      t.string :vote_type, null: false, index: true
      t.references :user, null: false, index: true
      t.integer :source_id, null: false

      t.timestamps null: false
    end
  end
end
