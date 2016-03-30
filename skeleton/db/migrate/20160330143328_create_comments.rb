class CreateComments < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
  		t.references :user, index: true, null: false
  		t.integer :commentable_id, null: false, index: true
  		t.string :commentable_type, null: false
  		t.text :content, null: false

      t.timestamps null:false
  	end
  end
end
