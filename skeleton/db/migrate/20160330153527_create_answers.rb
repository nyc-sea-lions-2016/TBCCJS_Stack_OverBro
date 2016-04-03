class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content, null: false
      t.references :user
      t.references :question
      t.boolean :best_answer?, default: false

      t.timestamps null: false
  end
  end
end
