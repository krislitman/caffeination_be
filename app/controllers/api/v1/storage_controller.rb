class Api::V1::StorageController < ApplicationController
  def create
    what_to_store = params.dig(:args,:type)
    case
    when what_to_store == "store_user_and_session"
      user = params.dig(:args,:user)
      session = params.dig(:args,:session)
      user_response = create_user(user)
      session_response = create_session(session)
      if user_response[:message].errors.nil?
        user, session = user_response[:user], session_response[:session]
        render StorageSerializer.new(user, session)
      else
        # Create Error Handling
      end
    end
  end

  private

  def create_user(user)
    user = User.create(
        first_name: user[:first_name],
        last_name: user[:last_name],
        address_1: user[:address_1],
        address_2: user[:address_2],
        city: user[:city],
        state: user[:state],
        zipcode: user[:zipcode],
        email: user[:email],
        favorite_beverage: user[:favorite_beverage],
        username: user[:username]
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
