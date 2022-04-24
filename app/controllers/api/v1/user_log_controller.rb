class Api::V1::UserLogController < ApplicationController
	def create
		if params[:payload].nil?
			render json: {message: "No parameters provided"}, status: :bad_request
		end
	end
end
