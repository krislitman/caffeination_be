FactoryBot.define do
	factory :storage_log do
		sequence :configuration do |n|
			"#{Faker::Games::Pokemon.name}-#{n}"
		end
		user
	end
end
