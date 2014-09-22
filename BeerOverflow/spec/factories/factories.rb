FactoryGirl.define do
	factory :user do
		username {Faker::Internet.user_name}
		password {"abc"}
	end
	factory :question do
		question { Faker::Lorem.sentence }
		user_id {1}
		user
	end

end