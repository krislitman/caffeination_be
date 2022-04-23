require "rails_helper"

RSpec.describe "User Log can be created", type: :request do
	after :all do
		StorageLog.destroy_all
	end

	setup do
		@headers = {'CONTENT_TYPE' => 'application/json',
			'ACCEPT' => 'application/json'}
		@params = {
			type: :user,
			event: :create,
			first_name: "Apollo",
			last_name: "Breviario",
			username: "Apollo_Eros",
			email: "example@example.com",
			zipcode: 86753
		}
	end

	context "Request will be successful with payload" do
		it "api/vi/store" do
			post api_v1_store_path, headers: @headers, params: @params.to_json
			resp = JSON.parse(response.body, symbolize_names: true)

			expect(response).to be_successful
			expect(response.status).to eq(201)
			expect(resp).to be_a(Hash)
		end
	end
end
