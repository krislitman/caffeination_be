class Api::V1::StorageController < ApplicationController
  def create
      what_to_store = params.dig(:type)
      case
      when what_to_store == "store_user_and_session"
        user = params.dig(:user)
        session = params.dig(:session)
        user_response = create_user(user)
        session_response = create_session(session)
        if user_response[:message].errors.nil? && user_response[:user]
          user, session = user_response[:user], session_response[:session]
          render StorageSerializer.new(user, session)
        else
          message = user_response[:message]
          render json: message, status: 400
        end
      when !what_to_store
        render json: { message: 'No parameters given' }, status: 400
      end
  end

  private

  def create_user(user)
    user = User.create(
        reference_id: user[:id],
        configuration: user
        )
    require 'pry'; binding.pry
    message = user.save
    {user: user, message: message}
  end

  def create_session(session)
    session = Session.create(
      user_id: session[:user_id]
    )
    message = session.save
    {session: session, message: message}
  end
end
