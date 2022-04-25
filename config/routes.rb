Rails.application.routes.draw do
	# Store Objects from FE
	namespace :api do
		namespace :v1 do
			# User Logs
			post "/user_log", to: "user_log#create"

			# Favorite
			post "/favorite", to: "coffee_shop#create"
			delete "/favorite", to: "coffee_shop#destroy"

			# Find User
			get "/user", to: "user#find"

			# Find User Favorites
			get "/user_favorites", to: "user#find_favorites"

			# Find If Shop is Favorited
			get "/coffee_shop_favorite", to: "coffee_shop#favorite_check"
		end
	end
end
