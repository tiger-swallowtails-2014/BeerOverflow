class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answers
      t.belongs_to :question
      t.belongs_to :user
    end
  end
end
