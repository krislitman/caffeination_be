Rails.application.routes.draw do
	# Store Objects from FE
	namespace :api do
		namespace :v1 do
			# User Logs
			post "/user_log", to: "user_log#create"

			# Favorite
			post "favorite", to: "coffee_shop#create"
		end
	end
end
