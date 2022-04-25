class Api::V1::UserLogController < ApplicationController
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
