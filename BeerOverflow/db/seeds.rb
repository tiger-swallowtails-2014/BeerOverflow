require 'faker'

def seed
  5.times {User.create(username: Faker::Internet.user_name, password: "abc")}
  
  User.all.each do |user|
    user.questions.create(question: Faker::Lorem.sentence)
  end
  
  Question.all.each do |question|
    3.times {question.answers.create(answer: Faker::Lorem.sentence, user_id: rand(5)+1)}
  end
end

seed
