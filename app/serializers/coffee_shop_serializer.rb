class CoffeeShopSerializer
	include JSONAPI::Serializer
	attributes :id, :yelp_id, :name, :user_id, :rating
end
