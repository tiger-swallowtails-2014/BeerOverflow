class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :answer
      t.boolean :best, default: false
      t.belongs_to :question
      t.belongs_to :user
      t.timestamps
    end
  end
end


# Discussion:
#
# Answer.find(1).best_answer
#
# def best_answer
#   answers.find{ |a| a.best }
# end
#
# alias :has_best_answer? :best_answer
