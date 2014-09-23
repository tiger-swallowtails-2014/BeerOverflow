require 'rails_helper'

# class Greeter
#   def initialize(language)
#     @language = language
#   end
#
#   def greet!
#     puts if @language == 'fr'
#       'bonjour'
#     else
#       'hello'
#     end
#   end
# end

describe Answer do
  # No, you should use DatabaseCleaner gem here.  See the book.
  before(:each) do
    Question.delete_all
    Answer.delete_all
  end

  it "is requires a question_id to a question" do
    expect(Answer.new(answer: "test answer")).to_not be_valid
  end

  it "is added to the database when created" do
    count = Answer.all.count
    question = Question.create(question: "test question", user_id: 1)
    Answer.create(answer: "test answer", question_id: question.id, user_id: 1)
    expect(Answer.all.count).not_to eq(count)
  end
end
