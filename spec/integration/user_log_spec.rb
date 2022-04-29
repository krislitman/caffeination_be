require 'swagger_helper'

describe 'Creating a User Log' do

  path '/api/v1/user_log' do

    post 'Creates a User Log' do
      tags 'User Log'
      consumes 'application/json'
      parameter name: :payload, in: :body, schema: {
        type: :object,
        properties: {
			payload: {
				type: :object,
				properties: {
					type: { type: :string },
					event: { type: :string },
					id: { type: :string },
					first_name: { type: :string },
					last_name: { type: :string },
					user_name: { type: :string },
					email: { type: :string },
					zipcode: { type: :string }
				}
			}
        },
        required: [ 'payload', 'type', 'event', 'id', 'first_name', 'last_name', 'user_name', 'email', 'zipcode']
      }

      response '201', 'user_log created' do
        let(:blog) { { title: 'foo', content: 'bar' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:blog) { { title: 'foo' } }
        run_test!
      end
    end
  end
end
