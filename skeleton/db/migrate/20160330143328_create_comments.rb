class CreateComments < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
  		t.references :user, index: true, null: false
  		t.integer :commentable_id
  		t.string :commentable_type
  		t.text :content, null: false
  		t.integer :source_id, null: false, index: true

      t.timestamps null:false
  	end
  end
end
