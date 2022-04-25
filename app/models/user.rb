class User < ApplicationRecord
	validates :reference_id, presence: true
	validates :configuration, presence: true

	has_many :storage_logs

	def find_favorites
		CoffeeShop.where(user_id: id)
	end
end
