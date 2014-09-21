class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.belongs_to :user
      t.timestamps
    end
  end
end
