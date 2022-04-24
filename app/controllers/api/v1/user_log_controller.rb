class Api::V1::UserLogController < ApplicationController
	def create
		begin
			user = User.create(
				reference_id: params.dig(:payload, :user, :id),
				first_name: params.dig(:payload, :user, :first_name),
				last_name: params.dig(:payload, :user, :last_name),
				username: params.dig(:payload, :user, :username),
				email: params.dig(:payload, :user, :email),
				zipcode: params.dig(:payload, :user, :zipcode)
			)
			storage_log = StorageLog.create(
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
				render json: StorageLogSerializer.new(storage_log), status: 201
			elsif !storage_log.save
				render json: storage_log.errors.full_messages, status: 400
			elsif !user.save
				render json: user.errors.full_messages, status: 400
			end
		rescue
			render json: {message: "Bad Request, please try again"}, status: :bad_request
		end
	end
end
