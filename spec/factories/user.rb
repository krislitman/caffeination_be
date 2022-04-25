FactoryBot.define do
	factory :user do
		sequence :reference_id do |n|
			"Reference_id: #{n}"
		end
		first_name {"#{Faker::Games::Pokemon.name}"}
		last_name {"#{Faker::Games::Pokemon.move}"}
		sequence :username do |n|
			"user-#{n}"
		end
		email {"#{Faker::Internet.safe_email}"}
		zipcode {"#{Faker::Address.zip_code}"}
	end
end
