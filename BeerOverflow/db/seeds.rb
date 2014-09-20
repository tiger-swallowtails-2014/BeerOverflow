require 'faker'

def seed
  5.times {User.create(username: Faker::Internet.user_name, password: "abc")}
  
  User.all.each do |user|
    user.questions.create(question: Faker::Lorem.sentence)
  end
  
  Question.all.each do |question|
    3.times {question.answers.create(answer: Faker::Lorem.sentence, user_id: rand(5)+1)}
    3.times {question.comments.create(comment: Faker::Lorem.sentence, user_id: rand(5)+1)}
    (rand(100)+1).times {question.votes.create(user_id: rand(5)+1)}
  end
  
  Answer.all.each do |answer|
    3.times {answer.comments.create(comment: Faker::Lorem.sentence, user_id: rand(5)+1)}
    (rand(100)+1).times {answer.votes.create(user_id: rand(5)+1)}
  end
  
  Comment.all.each do |comment|
    (rand(100)+1).times {comment.votes.create(user_id: rand(5)+1)}
  end
end

seed
