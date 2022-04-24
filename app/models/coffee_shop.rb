class CoffeeShop < ApplicationRecord
	validates :yelp_id, presence: true

	belongs_to :user
end
