class Api::V1::StorageController < ApplicationController
  def create
      what_to_store = params.dig(:type)
      case
      when what_to_store == "store_user_and_session"
        user = params.dig(:user)
        session = params.dig(:session)
        user_response = create_user(user)
        session_response = create_session(session)
        if user_response[:message] == true && user_response[:user]
          user, session = user_response[:user], session_response[:session]
          to_serialize = create_struct({user: user, session: session})
          render json: StorageSerializer.new(to_serialize), status: 201
        else
          message = user_response[:message]
          render json: message, status: 400
        end
      when !what_to_store
        render json: { message: 'No parameters given' }, status: 400
      end
  end

  private

  def create_struct(args)
    case
    when args[:user] && args[:session]
      object = OpenStruct.new(
        user: args[:user],
        session: args[:session]
      )
    end
    object
  end

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
