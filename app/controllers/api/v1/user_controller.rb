class Api::V1::UserController < ApplicationController
	def find
		user = User.find_by(email: params[:email])
		if user
			render json: UserSerializer.new(user), status: :ok
		else
			render json: nil, status: :not_found
		end
	end

	def find_favorites
		user = User.find_by(email: params[:email])
		favorites = user.find_favorites
		if user && favorites
			render json: CoffeeShopSerializer.new(favorites), status: :ok
		else
			render json: nil, status: :not_found
		end
	end
end
