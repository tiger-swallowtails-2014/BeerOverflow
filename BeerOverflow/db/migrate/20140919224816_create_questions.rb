class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question
      t.boolean :has_best_answer, default: false
      t.belongs_to :user
      t.timestamps
    end
  end
end
