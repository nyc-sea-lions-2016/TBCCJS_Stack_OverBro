class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :user_id, null: false
      t.string :headline, null: false
      t.string :content, null: false

      t.timestamps null: false
    end
  end
end