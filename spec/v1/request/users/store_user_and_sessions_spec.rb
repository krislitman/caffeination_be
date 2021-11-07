require "rails_helper"

RSpec.describe "api/v1/store", type: :request do
  after :all do
    Session.destroy_all
    User.destroy_all
    StorageLog.destroy_all
  end
  context "Only accepts POST requests" do
    it "Without arguements request will fail" do
      post api_v1_store_path, headers: { 'Content-Type' => 'application/json'}, params: {}
      expected = JSON.parse(response.body, symbolize_names: true)

      expect(response).not_to be_successful
      expect(response.status).to eq(400)
      expect(expected[:message]).to eq("No parameters given")
    end
  end
  context "With correct parameters, request will be successful" do
    it "Creates a User and Session when parameters are given" do
      headers = { 'CONTENT_TYPE' => 'application/json',
        'ACCEPT' => 'application/json'}
      parameters = {
        user: {
          id: 100,
          first_name: "Kris",
          last_name: "Litman",
          address_1: "111 Whatever St",
          address_2: "Unit Z",
          city: "Tampa",
          state: "FL",
          zipcode: "33333",
          email: "duguy8@gmail.com",
          username: "duguy8",
          favorite_beverage: "Nitro Cold Brew"
        },
        session: {
          user_id: 100
        },
        type: { store_user_and_session: true }
      }

      post api_v1_store_path, headers: headers, params: parameters.to_json
      expected = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(expected).to be_an_instance_of Hash
      expect(expected.dig(:data, :attributes, :configuration).keys).to include(:user)
      expect(expected.dig(:data, :attributes, :configuration).keys).to include(:session)
    end
  end
end
