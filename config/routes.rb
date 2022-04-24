Rails.application.routes.draw do
	# Store Objects from FE
	namespace :api do
		namespace :v1 do
			# User Logs
			post "/user_log", to: "user_log#create"
			post "/store", to: "storage#create"
			delete "/store", to: "storage#destroy_all_test"
		end
	end
end
