FactoryBot.define do
	factory :coffee_shop do
		sequence :yelp_id do |n|
			"Yelp_id: #{n}"
		end
		sequence :name do |n|
			"#{Faker::Coffee.blend_name}-#{n}"
		end
		rating { 10 }
		location { "#{Faker::Coffee.origin}" }
		user
	end
end
