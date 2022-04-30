FactoryBot.define do
	factory :user do
		sequence :reference_id do |n|
			"Reference_id: #{n}"
		end
		first_name {"Test User"}
		last_name {"Last Name Test User"}
		sequence :username do |n|
			"user-#{n}"
		end
		email {"example@example.com"}
		zipcode {"12345"}
	end
end
