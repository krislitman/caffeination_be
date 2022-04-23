require "rails_helper"

RSpec.describe "User Log can be created", type: :request do
	after :all do
		StorageLog.destroy_all
	end

	setup do
		@headers = {'CONTENT_TYPE' => 'application/json',
			'ACCEPT' => 'application/json'}
		@params = {
			"created_at"=>"2022-04-23 00:34:43 -0400",
			"payload"=>{
				"type"=>"user",
				"event"=>"create",
				"first_name"=>"Y A2eb Yyz Xz",
				"last_name"=>"Ua Cl Ft Fjt0",
				"username"=>"O3FnjPaqki",
				"email"=>"guy@example.com",
				"zipcode"=>"JKGCWTg1QT"}
		}
	end

	context "api/vi/store" do
		it "Request will be successful with payload" do
			post api_v1_store_path, headers: @headers, params: @params.to_json
			resp = JSON.parse(response.body, symbolize_names: true)

			expect(response).to be_successful
			expect(response.status).to eq(201)
			expect(resp).to be_a(Hash)
			expect(resp.dig(:data,:attributes,:configuration,:type)).to eq("user")
		end

		it "Will fail with no payload" do
			post api_v1_store_path, headers: @headers, params: {}

			expect(response).not_to be_successful
			expect(response.status).to eq(400)
		end
	end
end
