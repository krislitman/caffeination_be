require "rails_helper"

RSpec.describe "api/v1/store", type: :request do
  context "Only accepts POST requests" do
    it "Can store objects" do
      post "/api/v1/store"

      expect(response).to be_successful
      expect(response.status).to eq(201)
    end
  end
end
