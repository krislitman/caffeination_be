# require 'swagger_helper'

# describe 'Creating a User Log' do

#   path '/api/v1/user_log' do

#     post 'Creates a User Log' do
#       tags 'User Log'
#       consumes 'application/json'
#       parameter name: :payload, in: :body, schema: {
#         type: :object,
#         properties: {
# 			payload: {
# 				type: :object,
# 				properties: {
# 					type: { type: :string },
# 					event: { type: :string },
# 					id: { type: :string },
# 					first_name: { type: :string },
# 					last_name: { type: :string },
# 					user_name: { type: :string },
# 					email: { type: :string },
# 					zipcode: { type: :string }
# 				}
# 			}
#         },
#         required: [ 'payload', 'type', 'event', 'id', 'first_name', 'last_name', 'user_name', 'email', 'zipcode']
#       }
#     end
# end
# end
