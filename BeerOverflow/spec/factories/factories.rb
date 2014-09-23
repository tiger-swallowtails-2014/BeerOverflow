# You can define these in separate files...
#
#
#factory :user do
#  factory :admin_user do
#  end
#end
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
