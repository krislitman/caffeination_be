Rails.application.routes.draw do
#   mount Rswag::Ui::Engine => '/api-docs'
#   mount Rswag::Api::Engine => '/api-docs'
	# Store Objects from FE
	namespace :api do
		namespace :v1 do
			# Test
			get "/test", to: "test#index"

			# User Logs
			resources :user_log, only: [:create], controller: :user_log
			post "/user_log", to: "user_log#create"

			# Favorite
			post "/favorite", to: "coffee_shop#create"
			delete "/favorite", to: "coffee_shop#destroy"

			# # Find User
			get "/user", to: "user#find"

			# # Find User Favorites
			get "/user_favorites", to: "user#find_favorites"

			# # Find If Shop is Favorited
			get "/coffee_shop_favorite", to: "coffee_shop#favorite_check"
		end
	end
end
