require "rails_helper"

RSpec.describe "User and Storage Log can be created", type: :request do
	after(:all) do
		User.destroy_all
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

	context "POST api/v1/user_log" do
		it "Is not successful with no parameters" do
			post api_v1_user_log_path, headers: @headers, params: {}

			expect(response).not_to be_successful
			expect(response.status).to eq(400)
		end
	end
end
