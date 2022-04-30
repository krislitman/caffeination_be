class CoffeeShop < ApplicationRecord
	validates :yelp_id, presence: true

	belongs_to :user

	class << self

		def check_if_favorited(user_id, yelp_id)
			check = CoffeeShop.find_by(
				user_id: user_id,
				yelp_id: yelp_id
			)

			if check
				true
			else
				false
			end
		end
	end
end
