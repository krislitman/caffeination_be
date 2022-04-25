class UserSerializer
	include JSONAPI::Serializer
	attributes :id, :reference_id, :configuration, :created_at, :updated_at, :first_name, :last_name, :username, :email, :zipcode
end
