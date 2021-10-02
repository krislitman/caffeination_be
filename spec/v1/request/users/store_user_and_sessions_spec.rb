require "rails_helper"

RSpec.describe "api/v1/store", type: :request do
  context "Only accepts POST requests" do
    it "Without arguements request will fail" do
      post "/api/v1/store"

      expect(response).not_to be_successful
      expect(response.status).to eq(400)
    end
  end
  context "With correct parameters, request will be successful" do
    it "Creates a User and Session when parameters are given" do
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
        type: "store_user_and_session"
      }

      post "/api/v1/store", params: parameters
      response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(201)
    end
  end
end
