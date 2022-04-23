class Api::V1::StorageController < ApplicationController
	def create
		begin
		request_type = parse(params.dig(:type))
		case
		when request_type.keys.include?(:store_user_and_session) || request_type.keys.include?("store_user_and_session")
			user = parse(params.dig(:user))
			session = parse(params.dig(:session))
			user_response = create_user(user)
			session_response = create_session(session)
			if user_response.dig(:message) == true && user_response.dig(:user)
				user, session = user_response.dig(:user), session_response.dig(:session)
				storage_log = StorageLog.create(
					configuration: {
					user: user,
					session: session
					}
				)
				if storage_log.save
					render json: StorageLogSerializer.new(storage_log), status: 201
				else
					render json: storage_log.errors.full_messages, status: 400
				end
			else
				message = user_response[:message]
				render json: message, status: 400
			end
		when !request_type
			render json: { message: 'No parameters given' }, status: 400
		end
		rescue
			render json: { message: 'No parameters given' }, status: 400
		end
	end

	def destroy_all_test
		raise "There was an error destroying users" unless User.destroy_all
		raise "There was an error destroying sessions" unless Session.destroy_all
		raise "There was an error destroying storage_logs" unless StorageLog.destroy_all

		render json: { message: 'Back End Database Cleared' }, status: 200
	end

	private

	def create_user(user)
		user = User.create(
			reference_id: user[:id],
			configuration: user
			)
		if user.save
			message = user.save
		else
			message = user.errors.full_messages
		end

		{user: user, message: message}
	end

	def create_session(session)
		session = Session.create(
			user_id: session[:user_id]
		)
		if session.save
			message = session.save
		else
			message = session.errors.full_messages
		end

		{session: session, message: message}
	end

	def parse(object)
		if object.class != ActionController::Parameters
			object = JSON.parse(object, symbolize_names: true)
		end
		object
	end
end
