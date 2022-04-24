class Api::V1::CoffeeShopController < ApplicationController
	def create
		begin
			coffee_shop = CoffeeShop.create(
				name: params.dig(:payload, :coffee_shop).dig(:name),
				yelp_id: params.dig(:payload, :coffee_shop).dig(:yelp_id),
				rating: params.dig(:payload, :coffee_shop).dig(:rating),
				location: params.dig(:payload, :coffee_shop).dig(:location),
				user_id: params.dig(:payload, :id)
			)
			storage_log = StorageLog.create(
				user_id: params.dig(:payload, :id),
				configuration: {
					type: params.dig(:payload, :type),
					event: params.dig(:payload, :event),
					created_at: params.dig(:created_at)
				}
			)
			if coffee_shop.save && storage_log.save
				render json: StorageLogSerializer.new(storage_log), status: :created
			elsif !storage_log.save
				render json: storage_log.errors.full_messages, status: :bad_request
			elsif !coffee_shop.save
				render json: coffee_shop.errors.full_messages, status: :bad_request
			end
		rescue
			render json: {message: "Bad Request, please try again"}, status: :bad_request
		end
	end
end
