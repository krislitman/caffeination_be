Rails.application.routes.draw do
	# Store Objects from FE
	namespace :api do
		namespace :v1 do
			# User Logs
			post "/user_log", to: "user_log#create"
		end
	end
end
