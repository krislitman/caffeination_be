class Api::V1::UserLogController < ApplicationController
	resource_description do
		formats [:json]
		api_versions "public"
	end

	api :POST, "/api/v1/user_log" "Create User Log"
	description "Create a User Log when User is created on Front-End"
	param :payload, Hash, desc: "Includes User Data" do
		param :type, String, desc: "Type of Request"
		param :event, String, desc: "Event Type"
		param :id, String, desc: "Id of User"
		param :first_name, String, desc: "First Name of User"
		param :last_name, String, desc: "Last Name of User"
		param :username, String, desc: "Username of User"
		param :email, String, desc: "Email of User"
		param :zipcode, String, desc: "ZipCode of User"
	end
	def create
		begin
			user = User.create(
				reference_id: params.dig(:payload, :id),
				first_name: params.dig(:payload, :first_name),
				last_name: params.dig(:payload, :last_name),
				username: params.dig(:payload, :username),
				email: params.dig(:payload, :email),
				zipcode: params.dig(:payload, :zipcode)
			)
			storage_log = StorageLog.create(
				user_id: user.id,
				configuration: {
					type: params.dig(:payload, :type),
					event: params.dig(:payload, :event),
					first_name: params.dig(:payload, :first_name),
					last_name: params.dig(:payload, :last_name),
					username: params.dig(:payload, :username),
					email: params.dig(:payload, :email),
					zipcode: params.dig(:payload, :zipcode),
					created_at: params.dig(:created_at)
				}
			)
			if user.save && storage_log.save
				render json: StorageLogSerializer.new(storage_log), status: :created
			elsif !storage_log.save
				render json: storage_log.errors.full_messages, status: :bad_request
			elsif !user.save
				render json: user.errors.full_messages, status: :bad_request
			end
		rescue
			render json: {message: "Bad Request, please try again"}, status: :bad_request
		end
	end
end
