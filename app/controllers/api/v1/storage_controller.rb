class Api::V1::StorageController < ApplicationController
  def create
    what_to_store = params.dig(:args,:type)
    case
    when what_to_store == "store_user_and_session"
      user = params.dig(:args,:user)
      session = params.dig(:args,:session)
      user_response = create_user(user)
      session_response = create_session(session)
      if user_response[:message].errors.nil? && user_response[:user]
        user, session = user_response[:user], session_response[:session]
        render StorageSerializer.new(user, session)
      else
        message = user_response[:message]
        render ErrorSerializer.new(message)
      end
    end
  end

  private

  def create_user(user)
    user = User.create(
        reference_id: user[:id],
        configuration: user
        )
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
