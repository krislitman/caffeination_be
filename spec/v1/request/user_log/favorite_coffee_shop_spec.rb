require "rails_helper"

RSpec.describe "Coffee Shop object and Storage Log created when a User favorites a Coffee Shop", type: :request do
	after(:all) do
		StorageLog.destroy_all
		CoffeeShop.destroy_all
		User.destroy_all
	end

	setup do
		@user = create(:user)
		@headers = {'CONTENT_TYPE' => 'application/json',
			'ACCEPT' => 'application/json'}
		@params = {
			"created_at"=>"2022-04-23 00:34:43 -0400",
			"payload"=>{
				"type"=>"user",
				"event"=>"favorite",
				"id"=>"#{@user.id}",
				"coffee_shop"=>{
					"name"=>"Blind Tiger",
					"rating"=>"9",
					"location"=>"Tampa, FL",
					"yelp_id"=>"adl;kfj;asdlfj"
				}
			}
		}
	end

	context "POST api/v1/favorite" do
		it "Is not successful with no parameters" do
			post api_v1_favorite_path, headers: @headers, params: {}

			expect(response).not_to be_successful
			expect(response.status).to eq(400)
		end

		it "Is successful with valid parameters" do
			post api_v1_favorite_path, headers: @headers, params: @params.to_json
			parsed = JSON.parse(response.body, symbolize_names: true)

			expect(response).to be_successful
			expect(response.status).to eq(201)
			expect(parsed).to be_a(Hash)
		end
	end
end
